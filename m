Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D73D7ED3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 22:07:15 +0200 (CEST)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8TM9-0007vw-Hj
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 16:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1m8TL3-0006JO-PP
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:06:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1m8TKz-0006RR-Gp
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:06:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso2756865wmq.0
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IskkNoparFv4iB2y5J96zFsisbdMN8oJGVFDaRGOTC0=;
 b=kZ/liIBqYSMDxseBIic6Eo7/FzDwiIE0owWIKxFn63DNzBA4pT+QTSv3TsD5/UAK5F
 4MG1E7wrs0c0m35dt7KLRzqXPR76poq0+wdc6rHPkrOcjsgLjScV562itHEDp7cP7axj
 I/HysOz3InYivRUQnAncIIWbgjyE/w3aSkRSmfXb9uZ4rmLeQTyJTGqnz4OgUe1zRi+0
 yIiYE9z68qvrmPdm4wUwULzDX9TPUL1CpvRzLecexsRi+RYRuL2eCAtmkm8v0Lzv4W5J
 yvDN8N3vVIf9fbRyPDvsiebr7NnyOVW8fL8/qpl/BSg6GJ+jO+y0ljrrwZvAfEaL8uGl
 hhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IskkNoparFv4iB2y5J96zFsisbdMN8oJGVFDaRGOTC0=;
 b=CdN6tTBkQvILjIBOPVduRbvX+tIT9Y1zOnSCfKV0yaDznC5+yEgwtB8v640sZTEk0I
 wwY0RkqrqCgw+zNW/cfGp5Z9kbpobAT4XvPRiC+MmbdVY8+xihTqMK5/+3LT95wEq2KA
 qXxs/szEU0JXaPGPnUCx56Tv4lOvRYT49XbkiezHaiEz54VIkWHURwPgWhMIJgPwCmpa
 nKAxIsTEQMJpQxEOH6MsXYASYEJ/SeKENFlKUnoc8SuDLZRgbxCKMoFWyfBuTgVBZg6W
 ykwdlxUEJLbYdsffgQsOA+dGJSQmEqErndPR1pSPN1Lhdl6PBrWYYyqBCHW1SSyp3V2g
 OIkA==
X-Gm-Message-State: AOAM531009v9vFcO8Y+pxsEiEoQ4yuMulWSR9XMigU0or70+/VcWEpIk
 qT8JQVK1zdITinRMSr9LpD+b5m01chLg4gkhPfk7mw==
X-Google-Smtp-Source: ABdhPJy00kHc2xJp2cODtjNrXbh/DDwCql5a5d7DvY9eJ8+0nBSYD/UCOi7KX3jIGXUZjxL4ALfhO11WhN+5FpEueQ0=
X-Received: by 2002:a1c:7506:: with SMTP id o6mr15883706wmc.155.1627416358361; 
 Tue, 27 Jul 2021 13:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <20210529185522.78816-2-marcandre.lureau@redhat.com>
 <CADPb22TTc5dQ8c3N80tHjBdF36h2zJ5OxkN1DzCPpgnNpANmmw@mail.gmail.com>
 <CAJ+F1CLfh00zwnT2LpuqJeDGVg8WLSWXQg4TZvCDD3Gz2Qnkzw@mail.gmail.com>
In-Reply-To: <CAJ+F1CLfh00zwnT2LpuqJeDGVg8WLSWXQg4TZvCDD3Gz2Qnkzw@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Tue, 27 Jul 2021 13:05:21 -0700
Message-ID: <CADPb22Qq8h1uC0tKiny8yw_Tc7Kr=49vOA1CA94W6Ph_OUfRRA@mail.gmail.com>
Subject: Re: [PULL 1/2] Update libslirp to v4.5.0
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="000000000000f1c00205c820651a"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=dje@google.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f1c00205c820651a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all.
Just checking in to see where we are.
I just checked and master is still using the older libslirp.

On Fri, Jun 18, 2021 at 11:14 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Fri, Jun 18, 2021 at 8:05 PM Doug Evans <dje@google.com> wrote:
>
>> Hi. Does anything more need to be done here?
>> I just checked and I don't see this patch in the tree yet but it could
>> have been due to pilot error.
>>
>>
> My pull request failed on Peter side for non-obvious reasons:
> https://patchew.org/QEMU/20210529185522.78816-1-marcandre.lureau@redhat.c=
om/
> .
>
> I can drop the patch for the meson build changes for now (although I woul=
d
> really like to understand what's missing).
>
> Anyway, we will want to update libslirp copy to 4.6.1 now (current git
> master) which has recent CVE fixes.
>
> On Sat, May 29, 2021 at 11:55 AM <marcandre.lureau@redhat.com> wrote:
>>
>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>
>>> Switch from stable-4.2 branch to upstream v4.5.0 release.
>>>
>>> ## [4.5.0] - 2021-05-18
>>>
>>> ### Added
>>>
>>>  - IPv6 forwarding. !62 !75 !77
>>>  - slirp_neighbor_info() to dump the ARP/NDP tables. !71
>>>
>>> ### Changed
>>>
>>>  - Lazy guest address resolution for IPv6. !81
>>>  - Improve signal handling when spawning a child. !61
>>>  - Set macOS deployment target to macOS 10.4. !72
>>>  - slirp_add_hostfwd: Ensure all error paths set errno. !80
>>>  - More API documentation.
>>>
>>> ### Fixed
>>>
>>>  - Assertion failure on unspecified IPv6 address. !86
>>>  - Disable polling for PRI on MacOS, fixing some closing streams issues=
.
>>> !73
>>>  - Various memory leak fixes on fastq/batchq. !68
>>>  - Memory leak on IPv6 fast-send. !67
>>>  - Slow socket response on Windows. !64
>>>  - Misc build and code cleanups. !60 !63 !76 !79 !84
>>>
>>> ## [4.4.0] - 2020-12-02
>>>
>>> ### Added
>>>
>>>  - udp, udp6, icmp: handle TTL value. !48
>>>  - Enable forwarding ICMP errors. !49
>>>  - Add DNS resolving for iOS. !54
>>>
>>> ### Changed
>>>
>>>  - Improve meson subproject() support. !53
>>>  - Removed Makefile-based build system. !56
>>>
>>> ### Fixed
>>>
>>>  - socket: consume empty packets. !55
>>>  - check pkt_len before reading protocol header (CVE-2020-29129). !57
>>>  - ip_stripoptions use memmove (fixes undefined behaviour). !47
>>>  - various Coverity-related changes/fixes.
>>>
>>> ## [4.3.1] - 2020-07-08
>>>
>>> ### Changed
>>>
>>>  - A silent truncation could occur in `slirp_fmt()`, which will now
>>> print a
>>>    critical message. See also #22.
>>>
>>> ### Fixed
>>>
>>>  - CVE-2020-10756 - Drop bogus IPv6 messages that could lead to data
>>> leakage.
>>>    See !44 and !42.
>>>  - Fix win32 builds by using the SLIRP_PACKED definition.
>>>  - Various coverity scan errors fixed. !41
>>>  - Fix new GCC warnings. !43
>>>
>>> ## [4.3.0] - 2020-04-22
>>>
>>> ### Added
>>>
>>>  - `SLIRP_VERSION_STRING` macro, with the git sha suffix when building
>>> from git
>>>  - `SlirpConfig.disable_dns`, to disable DNS redirection #16
>>>
>>> ### Changed
>>>
>>>  - `slirp_version_string()` now has the git sha suffix when building
>>> form git
>>>  - Limit DNS redirection to port 53 #16
>>>
>>> ### Fixed
>>>
>>>  - Fix build regression with mingw & NetBSD
>>>  - Fix use-afte-free in `ip_reass()` (CVE-2020-1983)
>>>
>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> Reviewed-by: Doug Evans <dje@google.com>
>>> ---
>>>  slirp | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/slirp b/slirp
>>> index 8f43a99191..a62890e711 160000
>>> --- a/slirp
>>> +++ b/slirp
>>> @@ -1 +1 @@
>>> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
>>> +Subproject commit a62890e71126795ca593affa747f669bed88e89c
>>> --
>>> 2.29.0
>>>
>>>
>>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--000000000000f1c00205c820651a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi all.</div><div class=3D"gmail_default" style=3D"font-size:=
small">Just checking in to see where we are.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I just checked and master is still using the =
older libslirp.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Jun 18, 2021 at 11:14 AM Marc-Andr=C3=A9 Lurea=
u &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lureau@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 18, 2021 at 8:05 PM =
Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje@goog=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div style=3D"font-size:small">Hi. Does anything mor=
e need to be done here?</div><div style=3D"font-size:small">I just checked =
and I don&#39;t see this patch in the tree yet but it could have been due t=
o pilot error.</div></div><br></blockquote><div><br></div><div>My pull requ=
est failed on Peter side for non-obvious reasons: <a href=3D"https://patche=
w.org/QEMU/20210529185522.78816-1-marcandre.lureau@redhat.com/" target=3D"_=
blank">https://patchew.org/QEMU/20210529185522.78816-1-marcandre.lureau@red=
hat.com/</a>.</div><div><br></div><div>I can drop the patch for the meson b=
uild changes for now (although I would really like to understand what&#39;s=
 missing).</div><div><br></div><div>Anyway, we will want to update libslirp=
 copy to 4.6.1 now (current git master) which has recent CVE fixes.<br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 29, 20=
21 at 11:55 AM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D=
"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau=
@redhat.com</a>&gt;<br>
<br>
Switch from stable-4.2 branch to upstream v4.5.0 release.<br>
<br>
## [4.5.0] - 2021-05-18<br>
<br>
### Added<br>
<br>
=C2=A0- IPv6 forwarding. !62 !75 !77<br>
=C2=A0- slirp_neighbor_info() to dump the ARP/NDP tables. !71<br>
<br>
### Changed<br>
<br>
=C2=A0- Lazy guest address resolution for IPv6. !81<br>
=C2=A0- Improve signal handling when spawning a child. !61<br>
=C2=A0- Set macOS deployment target to macOS 10.4. !72<br>
=C2=A0- slirp_add_hostfwd: Ensure all error paths set errno. !80<br>
=C2=A0- More API documentation.<br>
<br>
### Fixed<br>
<br>
=C2=A0- Assertion failure on unspecified IPv6 address. !86<br>
=C2=A0- Disable polling for PRI on MacOS, fixing some closing streams issue=
s. !73<br>
=C2=A0- Various memory leak fixes on fastq/batchq. !68<br>
=C2=A0- Memory leak on IPv6 fast-send. !67<br>
=C2=A0- Slow socket response on Windows. !64<br>
=C2=A0- Misc build and code cleanups. !60 !63 !76 !79 !84<br>
<br>
## [4.4.0] - 2020-12-02<br>
<br>
### Added<br>
<br>
=C2=A0- udp, udp6, icmp: handle TTL value. !48<br>
=C2=A0- Enable forwarding ICMP errors. !49<br>
=C2=A0- Add DNS resolving for iOS. !54<br>
<br>
### Changed<br>
<br>
=C2=A0- Improve meson subproject() support. !53<br>
=C2=A0- Removed Makefile-based build system. !56<br>
<br>
### Fixed<br>
<br>
=C2=A0- socket: consume empty packets. !55<br>
=C2=A0- check pkt_len before reading protocol header (CVE-2020-29129). !57<=
br>
=C2=A0- ip_stripoptions use memmove (fixes undefined behaviour). !47<br>
=C2=A0- various Coverity-related changes/fixes.<br>
<br>
## [4.3.1] - 2020-07-08<br>
<br>
### Changed<br>
<br>
=C2=A0- A silent truncation could occur in `slirp_fmt()`, which will now pr=
int a<br>
=C2=A0 =C2=A0critical message. See also #22.<br>
<br>
### Fixed<br>
<br>
=C2=A0- CVE-2020-10756 - Drop bogus IPv6 messages that could lead to data l=
eakage.<br>
=C2=A0 =C2=A0See !44 and !42.<br>
=C2=A0- Fix win32 builds by using the SLIRP_PACKED definition.<br>
=C2=A0- Various coverity scan errors fixed. !41<br>
=C2=A0- Fix new GCC warnings. !43<br>
<br>
## [4.3.0] - 2020-04-22<br>
<br>
### Added<br>
<br>
=C2=A0- `SLIRP_VERSION_STRING` macro, with the git sha suffix when building=
 from git<br>
=C2=A0- `SlirpConfig.disable_dns`, to disable DNS redirection #16<br>
<br>
### Changed<br>
<br>
=C2=A0- `slirp_version_string()` now has the git sha suffix when building f=
orm git<br>
=C2=A0- Limit DNS redirection to port 53 #16<br>
<br>
### Fixed<br>
<br>
=C2=A0- Fix build regression with mingw &amp; NetBSD<br>
=C2=A0- Fix use-afte-free in `ip_reass()` (CVE-2020-1983)<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Reviewed-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_bl=
ank">dje@google.com</a>&gt;<br>
---<br>
=C2=A0slirp | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/slirp b/slirp<br>
index 8f43a99191..a62890e711 160000<br>
--- a/slirp<br>
+++ b/slirp<br>
@@ -1 +1 @@<br>
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
+Subproject commit a62890e71126795ca593affa747f669bed88e89c<br>
-- <br>
2.29.0<br>
<br>
<br>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div></div>

--000000000000f1c00205c820651a--

