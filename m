Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993213AD1EF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 20:16:19 +0200 (CEST)
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luJ2Q-00088p-1R
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 14:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luJ0p-0007R3-Ai
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 14:14:39 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1luJ0k-0004xK-Ie
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 14:14:38 -0400
Received: by mail-ej1-x62e.google.com with SMTP id nb6so17086522ejc.10
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 11:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M8EaobFJE2e1N6MPUhYBr8IOwCzqDiajp2XoEgXnFTo=;
 b=F8g+JkQG2Y+8cyUHGfVI53y1oldhe5LkDVDwvwDa/FGr+BeNn2mItFbsWK2O8dqOEu
 sKxJUmROArqcTv9j+T2Y76D7+T3ZOzKhi0MjjQb8T2DgG6oE1wkb6Q11LghoAoiI7wGK
 mQDRr/ar4H7qEWSnZM3WfmUbTYjNRgKoCL68IiixnTjEwaKVcoyrdlhg1j8uZJ5uh1Gz
 ss3pDqIMEZUqaIdEv3t+/ZitVzRCazzOJInccCcKvHi2ZfNpj7UMs3+L8aFujsXgFGJc
 KQGEBBl+J10TwMaWJXeeHBfqPDMbKLTFQyShrpVs+o63uegOClDSbvFljyd/0aeiWJJQ
 3phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M8EaobFJE2e1N6MPUhYBr8IOwCzqDiajp2XoEgXnFTo=;
 b=dBBn+d+nUbq0P53pZU93Lh7gwZilZRHdFX7OtAAcjZl5mwMD/+6XiiSHAFlkz83nme
 q/h91zKH1JYjy0/QwmZf98c2r+faxHCCmx0D/mPcb/NWbrWgpNCgbHL/je4JFOH+KvNC
 UlSwtFFe3NTb4lCbDqlVYwQ2zPVY/xgHBPv37OjM+AumRGKbfmad3rX23EohxfdZuURM
 B1Is18w103I7VHMXRxHT8ocb/JiGrgCwadMMw9XXBKu98Ppqbxwvoqf+h+Q68LAJoiMW
 URet1+MfTVNuiE1M43s/1LdUAKiZqr4x0e1cCIcQx3OP5tGqUUmkzv94DH69DQAvWf7E
 D84g==
X-Gm-Message-State: AOAM530x5kRjNcLdNE10kGEKSin51Hvz9dJGkZrpXsbL2fcyoyeoJpxV
 njHsV8+7enmM/pw/mbh0ebgQ2T13xK2LVwySqy0=
X-Google-Smtp-Source: ABdhPJxU90SuYlhBGPYi0BnSBQw2RwK/aBIf5gadHxY9ki4FnB/fX+eA6s8DTS5MusPRy+TwKzK/pBCKyGK3KMgrmbA=
X-Received: by 2002:a17:907:7b9e:: with SMTP id
 ne30mr12469214ejc.389.1624040072757; 
 Fri, 18 Jun 2021 11:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <20210529185522.78816-2-marcandre.lureau@redhat.com>
 <CADPb22TTc5dQ8c3N80tHjBdF36h2zJ5OxkN1DzCPpgnNpANmmw@mail.gmail.com>
In-Reply-To: <CADPb22TTc5dQ8c3N80tHjBdF36h2zJ5OxkN1DzCPpgnNpANmmw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 18 Jun 2021 22:14:21 +0400
Message-ID: <CAJ+F1CLfh00zwnT2LpuqJeDGVg8WLSWXQg4TZvCDD3Gz2Qnkzw@mail.gmail.com>
Subject: Re: [PULL 1/2] Update libslirp to v4.5.0
To: Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="000000000000a345f305c50e4b2a"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a345f305c50e4b2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jun 18, 2021 at 8:05 PM Doug Evans <dje@google.com> wrote:

> Hi. Does anything more need to be done here?
> I just checked and I don't see this patch in the tree yet but it could
> have been due to pilot error.
>
>
My pull request failed on Peter side for non-obvious reasons:
https://patchew.org/QEMU/20210529185522.78816-1-marcandre.lureau@redhat.com=
/
.

I can drop the patch for the meson build changes for now (although I would
really like to understand what's missing).

Anyway, we will want to update libslirp copy to 4.6.1 now (current git
master) which has recent CVE fixes.

On Sat, May 29, 2021 at 11:55 AM <marcandre.lureau@redhat.com> wrote:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Switch from stable-4.2 branch to upstream v4.5.0 release.
>>
>> ## [4.5.0] - 2021-05-18
>>
>> ### Added
>>
>>  - IPv6 forwarding. !62 !75 !77
>>  - slirp_neighbor_info() to dump the ARP/NDP tables. !71
>>
>> ### Changed
>>
>>  - Lazy guest address resolution for IPv6. !81
>>  - Improve signal handling when spawning a child. !61
>>  - Set macOS deployment target to macOS 10.4. !72
>>  - slirp_add_hostfwd: Ensure all error paths set errno. !80
>>  - More API documentation.
>>
>> ### Fixed
>>
>>  - Assertion failure on unspecified IPv6 address. !86
>>  - Disable polling for PRI on MacOS, fixing some closing streams issues.
>> !73
>>  - Various memory leak fixes on fastq/batchq. !68
>>  - Memory leak on IPv6 fast-send. !67
>>  - Slow socket response on Windows. !64
>>  - Misc build and code cleanups. !60 !63 !76 !79 !84
>>
>> ## [4.4.0] - 2020-12-02
>>
>> ### Added
>>
>>  - udp, udp6, icmp: handle TTL value. !48
>>  - Enable forwarding ICMP errors. !49
>>  - Add DNS resolving for iOS. !54
>>
>> ### Changed
>>
>>  - Improve meson subproject() support. !53
>>  - Removed Makefile-based build system. !56
>>
>> ### Fixed
>>
>>  - socket: consume empty packets. !55
>>  - check pkt_len before reading protocol header (CVE-2020-29129). !57
>>  - ip_stripoptions use memmove (fixes undefined behaviour). !47
>>  - various Coverity-related changes/fixes.
>>
>> ## [4.3.1] - 2020-07-08
>>
>> ### Changed
>>
>>  - A silent truncation could occur in `slirp_fmt()`, which will now prin=
t
>> a
>>    critical message. See also #22.
>>
>> ### Fixed
>>
>>  - CVE-2020-10756 - Drop bogus IPv6 messages that could lead to data
>> leakage.
>>    See !44 and !42.
>>  - Fix win32 builds by using the SLIRP_PACKED definition.
>>  - Various coverity scan errors fixed. !41
>>  - Fix new GCC warnings. !43
>>
>> ## [4.3.0] - 2020-04-22
>>
>> ### Added
>>
>>  - `SLIRP_VERSION_STRING` macro, with the git sha suffix when building
>> from git
>>  - `SlirpConfig.disable_dns`, to disable DNS redirection #16
>>
>> ### Changed
>>
>>  - `slirp_version_string()` now has the git sha suffix when building for=
m
>> git
>>  - Limit DNS redirection to port 53 #16
>>
>> ### Fixed
>>
>>  - Fix build regression with mingw & NetBSD
>>  - Fix use-afte-free in `ip_reass()` (CVE-2020-1983)
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Doug Evans <dje@google.com>
>> ---
>>  slirp | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/slirp b/slirp
>> index 8f43a99191..a62890e711 160000
>> --- a/slirp
>> +++ b/slirp
>> @@ -1 +1 @@
>> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
>> +Subproject commit a62890e71126795ca593affa747f669bed88e89c
>> --
>> 2.29.0
>>
>>
>>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a345f305c50e4b2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 18, 2021 at 8:05 PM Dou=
g Evans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div style=3D"font-size:small">Hi. Does anything more need to be done her=
e?</div><div style=3D"font-size:small">I just checked and I don&#39;t see t=
his patch in the tree yet but it could have been due to pilot error.</div><=
/div><br></blockquote><div><br></div><div>My pull request failed on Peter s=
ide for non-obvious reasons: <a href=3D"https://patchew.org/QEMU/2021052918=
5522.78816-1-marcandre.lureau@redhat.com/">https://patchew.org/QEMU/2021052=
9185522.78816-1-marcandre.lureau@redhat.com/</a>.</div><div><br></div><div>=
I can drop the patch for the meson build changes for now (although I would =
really like to understand what&#39;s missing).</div><div><br></div><div>Any=
way, we will want to update libslirp copy to 4.6.1 now (current git master)=
 which has recent CVE fixes.<br></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, May 29, 2021 at 11:55 AM &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a345f305c50e4b2a--

