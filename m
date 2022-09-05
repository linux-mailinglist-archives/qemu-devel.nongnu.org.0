Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2E5ACD7B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:15:38 +0200 (CEST)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV7GZ-00017F-Sk
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oV7BR-0006FF-Pq
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:10:18 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oV7BO-00024Y-UH
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:10:17 -0400
Received: by mail-qt1-x833.google.com with SMTP id j17so5641002qtp.12
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 01:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5F4VtOG6WgPG3st9s+2LykcLg+w0LLYIT9r/gXyTDh8=;
 b=XQHvmyZzz1RdHUzMGCVHZhhFmi4R60l6be09DtZCH9unPPAM8v30RzXl7hG5wEcJvR
 8HianYj+ri5tSprdk2+mW3leI4bW3BDmlX8I00lGJp021vGPyrvZGP3yO0EDQYd+1AuF
 Nabsgv0z7GVgz1YjtvK7DJYZXMyODlnx1jv5gUW6rVgbPZw5yT5OdGcQ6Fz9tx9/9HZM
 hNsUK7I4mizcuMus/MZnWjGd7iu4VZ2oHdjYhtKYHgqzaQqqCRq8y8ww3hGYtp2Ux0vL
 6CiJ6g7DxO2MsCx2ueyZQFvjKIDd3qHSgNyGiFdHoLFW7We5wLYC+hOcClQfjC15GiiV
 q5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5F4VtOG6WgPG3st9s+2LykcLg+w0LLYIT9r/gXyTDh8=;
 b=ZS7NToBntusAaBWhHH0up1VlM4sBgayVjuiHaMMPk5SfNvMflealgqZtX5ONHOnfPq
 +X/ODr6Z/ViBr4gVxsoDC3iUSjME6gH02WcReTIovgkK6FsEn716Z2VuxSvcMHgoJia8
 c2I50OtW0fv6Ml2SNYdTkPXHYFz2g6Fxwi3q2qe4te1jKglDCPX5SR+0EPmQ/hk/7gA5
 q5TL7z45b2les+v9YtDyYi1XrB1/6GWGfoy87kPa1YvU3PbW6NoPO8S5zgWcGvkhrTx9
 kayiAApUZKpSBzqFnax4YqtEsaO3HJVblVtvmrnoh7AXAFCoDMilL+CR1NdHsifkruTR
 /QHQ==
X-Gm-Message-State: ACgBeo0ESVOEkWAisNWVJY4phSLJndGHOACP2DmuPtmQ9VjnuhdG9GM8
 kvsm2wdv3xvuLe2HiP18tCphV4l7y8j0wWRIK9RSf5LPqwrcLw==
X-Google-Smtp-Source: AA6agR7vgut8WeWuRK8ROf6u/yBDsNDAjJHPObaWWEFhCz1JWk9440KECMEL/TF6BKUrkUvTcM9vQJYQh56uDRfF/Wo=
X-Received: by 2002:a05:622a:15d4:b0:344:6a92:d8dc with SMTP id
 d20-20020a05622a15d400b003446a92d8dcmr37726466qty.114.1662365413597; Mon, 05
 Sep 2022 01:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
 <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
 <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
In-Reply-To: <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Mon, 5 Sep 2022 10:10:02 +0200
Message-ID: <CAJ307EiOGrHqfdzSfb6L3MPKtAWLPCQT8ZVY7M+R5mT6d9wVvQ@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/mixed; boundary="000000000000f72d0c05e7e99b8b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=chigot@adacore.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

--000000000000f72d0c05e7e99b8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I did reach the same issue while trying to connect a gdb to qemu on
Windows hosts. Some inputs send by gdb aren't getting correctly pulled,
they will be retrieved only once g_poll times out.

As you explained earlier, the issue, AFAICT, is that WSAEnumNetworkEvents
will reset the internal events before select can detect them.
Sadly, I didn't find any way to adjust the current code using select to
avoid that. As select and any cleaner (ever WSAEnumNetworkEvents or
WSEResetEvent) cannot be called in an atomic way, it seems that events
can always be received between the reset and the select. At least, all
my attempts failed.

The only solution I've found is to move completely to the Windows API
and stop calling select. This, however, needs some tricks. In Particular, w=
e
need to "remove" the support of GSources having only G_IO_HUP.
This is already kind of done as we currently don't detect them in
qio_channel_socket_source_check anyway.
This is mandatory because of the two GSources created on the same socket.
IIRC, the first one (I'll call it the master GSource) is created during
the initialization of the channel-socket by update_ioc_handlers and will
have only G_IO_HUP to catch up.
The second one is created during the "prepare" phase of the first one,
in io_watch_poll_prepare. This one will have all the events we want
to pull (G_IO_IN here).
As they are referring to the same socket, the Windows API cannot know
on which GSources we want to catch which events. The solution is then
to avoid WSAEnumNetworkEvents for the master GSource which only has
G_IO_HUP (or for any GSource having only that).
As I said above, the current code doesn't do anything with it anyway.
So, IMO, it's safe to do so.

I'll send you my patch attached. I was planning to send it in the following
weeks anyway. I was just waiting to be sure everything looks fine on our
CI. Feel free to test and modify it if needed.

PS: I don't know if it will correctly extend if I simply attach it to
my mail. If not, tell me I'll simply copy-paste it, even if it might
mess up the space/tab stuff.

> >> >>
> >> >> ---
> >> >> During the testing, I removed the following codes in update_ioc_han=
dlers():
> >> >>
> >> >>     remove_hup_source(s);
> >> >>     s->hup_source =3D qio_channel_create_watch(s->ioc, G_IO_HUP);
> >> >>     g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
> >> >>                           chr, NULL);
> >> >>     g_source_attach(s->hup_source, chr->gcontext);
> >> >>
> >> >> and such change also makes the symptom go away.
> >> >>
> >> >> And if I moved the above codes to the beginning, before the call to
> >> >> io_add_watch_poll(), the symptom also goes away.
> >> >>
> >> >> It seems two sources watching on the same socket event object is
> >> >> the key that leads to the instability. The order of adding a source
> >> >> watch seems to also play a role but I can't explain why.
> >> >> Hopefully a Windows and glib expert could explain this behavior.
> >> >>
> >> >
> >> > Feel free to leave that comment in the commit message.
> >>
> >> Sure, will add the above message into the commit in v2.
> >>
> >> >
> >> > This is strange, as both sources should have different events, clear=
ing one shouldn't affect the other.
> >>
> >> Both sources have the same event, as one QIO channel only has one
> >> socket, and one socket can only be bound to one event.
> >
> >
> >  "one socket can only be bound to one event", is that a WSAEventSelect =
limitation?
> >
>
> Yes, please see the MSDN:
>
> It is not possible to specify different event objects for different
> network events. The following code will not work; the second call will
> cancel the effects of the first, and only the FD_WRITE network event
> will be associated with hEventObject2:
>
> rc =3D WSAEventSelect(s, hEventObject1, FD_READ);
> rc =3D WSAEventSelect(s, hEventObject2, FD_WRITE); //bad

Yes, the Windows API is handled at socket levels. That's why having
two GSources on the same sockets is problematic.
Note that maybe there is a mix to be done between your patch with
the update_ioc_handlers part to be removed and my patch which improves
the polling of channel-watch.

Thanks,
Cl=C3=A9ment

--000000000000f72d0c05e7e99b8b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-io-switch-completely-to-Windows-API-for-socket-watch.patch"
Content-Disposition: attachment; 
	filename="0001-io-switch-completely-to-Windows-API-for-socket-watch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l7oh7h2n0>
X-Attachment-Id: f_l7oh7h2n0

RnJvbSAxOTQ4ZmMyNzNjNGY0Yjc4ZjkwYzhjYThmYmMyMjY0N2UzMGY0MzFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Q2w9QzM9QTltZW50PTIwQ2hpZ290Pz0gPGNo
aWdvdEBhZGFjb3JlLmNvbT4KRGF0ZTogV2VkLCAyNCBBdWcgMjAyMiAxNTo0MjozMyArMDIwMApT
dWJqZWN0OiBbUEFUQ0hdIGlvOiBzd2l0Y2ggY29tcGxldGVseSB0byBXaW5kb3dzIEFQSSBmb3Ig
c29ja2V0IHdhdGNoIG9uCiB3aW4zMgoKVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXMgdXNp
bmcgYSBtaXhlZCBvZiBzZWxlY3QgYW5kIHRoZSBXaW5kb3dzCkFQSSAoV1NBU2VsZWN0RXZlbnQs
IGV0YykuCkFzIHNlbGVjdCBkb2Vzbid0IGNsZWFyIHRoZSBXaW5kb3dzIGV2ZW50cywgV1NBRU51
bU5ldHdvcmtFdmVudHMgbXVzdCBiZQpjYWxsZWQgYmVmb3JlIHNlbGVjdCB0byBkbyBpdC4KSG93
ZXZlciwgYXMgdGhpcyBvcGVyYXRpb24gaXNuJ3QgbWFkZSBhdG9taWNhbGx5LCBzb21lIGV2ZW50
cyBtaWdodCBiZQpyZXNldCBiZWZvcmUgYmVpbmcgcmV0cmlldmVkIGJ5IHNlbGVjdC4gUmVzdWx0
aW5nIGluIHRoZW0gYmVpbmcgc2tpcHBlZApieSB0aGUgcG9sbGluZy4KCkluIG9yZGVyIHRvIGF2
b2lkIHRoaXMgaXNzdWUsIHRoaXMgcGF0Y2ggaW1wcm92ZXMgc29ja2V0IHdhdGNoIHRvIGJlCmJh
c2VkIHNvbGVseSBvbiBXaW5kb3dzIEFQSS4KCk5vdGUgdGhhdCBiZWNhdXNlIHNldmVyYWwgR1Nv
dXJjZXMgbWlnaHQgYmUgY3JlYXRlZCBmb3IgdGhlIHNhbWUgSEFORExFLAp0aGlzIGltcGxlbWVu
dGF0aW9uIGhhcyBubyB3YXkgdG8ga25vdyBvbiB3aGljaCBHU291cmNlcyBhbiBldmVudCBtdXN0
IGJlCnJldHVybmVkLiBIb3dldmVyLCBpdCBzZWVtcyB0aGF0IG9ubHkgdHdvIEdTb3VyY2VzIGFy
ZSBjcmVhdGVkLCBhIG1hc3RlcgpvbmUgd2l0aCBqdXN0ICJHX0lPX0hVUCIgYW5kIHRoZSBjaGls
ZCBvbmUgd2hpY2ggYWltcyB0byByZXRyaWV2ZSBhbGwKdGhlIGV2ZW50cyAoaWUgd2l0aCAiR19J
T19JTiIsICJHX0lPX09VVCIsIGV0YykuIFNvLCB0byBhdm9pZCB0aGUgbWFzdGVyCkdTb3VyY2Ug
cmVjZWl2aW5nIGV2ZW50cyBtZWFudCBmb3IgdGhlIGNoaWxkLCB3ZSBhcmVuJ3QgY2FsbGluZwpX
U0FFbnVtTmV0d29ya0V2ZW50cyBmb3IgaXQgKG9yIGZvciBhbnkgR1NvdXJjZSBoYXZpbmcgb25s
eSBHX0lPX0hVUCBhcwpjb25kaXRpb24pLiBBcyBHX0lPX0hVUCB3YXMgbmV2ZXIgcmV0dXJuZWQg
YnkgdGhlIHByZXZpb3VzLCBJIHN1cHBvc2VkCnRoYXQgaXQgc2hvdWxkIGJlIHNhZmUgdG8gZG8g
c28uCgpUTjogVjgxMi0wMjAKQ2hhbmdlLUlkOiBJMDM3ZmJlOTNlMDY0MTg5NGIwMDk2YzM5YWNl
NWQwZDY4ZGI4ZTJlMwotLS0KIGlvL2NoYW5uZWwtc29ja2V0LmMgfCAgMiArLQogaW8vY2hhbm5l
bC13YXRjaC5jICB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9pby9jaGFubmVsLXNvY2tldC5jIGIvaW8vY2hhbm5lbC1zb2NrZXQuYwpp
bmRleCBiNzZkY2E5Y2MxLi43NTUwMGU1NjQ3IDEwMDY0NAotLS0gYS9pby9jaGFubmVsLXNvY2tl
dC5jCisrKyBiL2lvL2NoYW5uZWwtc29ja2V0LmMKQEAgLTY5LDcgKzY5LDcgQEAgcWlvX2NoYW5u
ZWxfc29ja2V0X25ldyh2b2lkKQogICAgIHFpb19jaGFubmVsX3NldF9mZWF0dXJlKGlvYywgUUlP
X0NIQU5ORUxfRkVBVFVSRV9TSFVURE9XTik7CiAKICNpZmRlZiBXSU4zMgotICAgIGlvYy0+ZXZl
bnQgPSBDcmVhdGVFdmVudChOVUxMLCBGQUxTRSwgRkFMU0UsIE5VTEwpOworICAgIGlvYy0+ZXZl
bnQgPSBXU0FDcmVhdGVFdmVudCgpOwogI2VuZGlmCiAKICAgICB0cmFjZV9xaW9fY2hhbm5lbF9z
b2NrZXRfbmV3KHNpb2MpOwpkaWZmIC0tZ2l0IGEvaW8vY2hhbm5lbC13YXRjaC5jIGIvaW8vY2hh
bm5lbC13YXRjaC5jCmluZGV4IDAyODliMzY0N2MuLjljOWFjYTQxZjUgMTAwNjQ0Ci0tLSBhL2lv
L2NoYW5uZWwtd2F0Y2guYworKysgYi9pby9jaGFubmVsLXdhdGNoLmMKQEAgLTExNCw0NiArMTE0
LDM5IEBAIHFpb19jaGFubmVsX3NvY2tldF9zb3VyY2VfcHJlcGFyZShHU291cmNlICpzb3VyY2Ug
R19HTlVDX1VOVVNFRCwKIHN0YXRpYyBnYm9vbGVhbgogcWlvX2NoYW5uZWxfc29ja2V0X3NvdXJj
ZV9jaGVjayhHU291cmNlICpzb3VyY2UpCiB7Ci0gICAgc3RhdGljIHN0cnVjdCB0aW1ldmFsIHR2
MDsKLQogICAgIFFJT0NoYW5uZWxTb2NrZXRTb3VyY2UgKnNzb3VyY2UgPSAoUUlPQ2hhbm5lbFNv
Y2tldFNvdXJjZSAqKXNvdXJjZTsKICAgICBXU0FORVRXT1JLRVZFTlRTIGV2OwotICAgIGZkX3Nl
dCByZmRzLCB3ZmRzLCB4ZmRzOwogCiAgICAgaWYgKCFzc291cmNlLT5jb25kaXRpb24pIHsKICAg
ICAgICAgcmV0dXJuIDA7CiAgICAgfQogCi0gICAgV1NBRW51bU5ldHdvcmtFdmVudHMoc3NvdXJj
ZS0+c29ja2V0LCBzc291cmNlLT5pb2MtPmV2ZW50LCAmZXYpOwotCi0gICAgRkRfWkVSTygmcmZk
cyk7Ci0gICAgRkRfWkVSTygmd2Zkcyk7Ci0gICAgRkRfWkVSTygmeGZkcyk7Ci0gICAgaWYgKHNz
b3VyY2UtPmNvbmRpdGlvbiAmIEdfSU9fSU4pIHsKLSAgICAgICAgRkRfU0VUKChTT0NLRVQpc3Nv
dXJjZS0+c29ja2V0LCAmcmZkcyk7Ci0gICAgfQotICAgIGlmIChzc291cmNlLT5jb25kaXRpb24g
JiBHX0lPX09VVCkgewotICAgICAgICBGRF9TRVQoKFNPQ0tFVClzc291cmNlLT5zb2NrZXQsICZ3
ZmRzKTsKLSAgICB9Ci0gICAgaWYgKHNzb3VyY2UtPmNvbmRpdGlvbiAmIEdfSU9fUFJJKSB7Ci0g
ICAgICAgIEZEX1NFVCgoU09DS0VUKXNzb3VyY2UtPnNvY2tldCwgJnhmZHMpOworICAgIC8qIEZv
ciBub3csIHdlIGRvbid0IHN1cHBvcnQgR19JT19IVVAgY2hlY2tzLgorICAgICAgIFdlIHdhbnQg
dG8gYXZvaWQgY2FsbGluZyBXU0FFbnVtTmV0d29ya0V2ZW50cyBmb3IgYW55IEdTb3VyY2UKKyAg
ICAgICBoYXZpbmcganVzdCBHX0lPX0hVUC4gSXQgbWlnaHQgaGlkZSBldmVudHMgYWltZWQgdG8g
YmUgcmV0cmlldmVkIGJ5CisgICAgICAgb3RoZXIgR1NvdXJjZXMgd2FpdGluZyBpbnB1dHMgb3Ig
b3V0cHV0cyAoaWUgd2l0aCBHX0lPX0lOIG9yIEdfSU9fT1VUKS4KKyAgICAgICBUaGUgcmVhc29u
IGlzIHRoYXQgdGhlIFdpbmRvd3MgQVBJIGlzIGJhc2VkIG9uIEhBTkRMRSBidXQgd2Ugb2Z0ZW4K
KyAgICAgICBjcmVhdGUgc2V2ZXJhbCBHU291cmNlcyBmb3IgdGhlIHNhbWUgSEFORExFLiBUaHVz
LCBpbnB1dCBldmVudHMgbWlnaHQKKyAgICAgICBiZSBwaWNrZWQgYW5kIGNsZWFyZWQgYnkgdGhl
IEdfSU9fSFVQIEdTb3VyY2UuICAqLworICAgIGlmIChzc291cmNlLT5jb25kaXRpb24gPT0gR19J
T19IVVApIHsKKyAgICAgICAgcmV0dXJuIDA7CiAgICAgfQotICAgIHNzb3VyY2UtPnJldmVudHMg
PSAwOwotICAgIGlmIChzZWxlY3QoMCwgJnJmZHMsICZ3ZmRzLCAmeGZkcywgJnR2MCkgPT0gMCkg
eworCisgICAgaWYgKFdTQUVudW1OZXR3b3JrRXZlbnRzKHNzb3VyY2UtPnNvY2tldCwgc3NvdXJj
ZS0+aW9jLT5ldmVudCwgJmV2KSkgewogICAgICAgICByZXR1cm4gMDsKICAgICB9CiAKLSAgICBp
ZiAoRkRfSVNTRVQoc3NvdXJjZS0+c29ja2V0LCAmcmZkcykpIHsKKyAgICBzc291cmNlLT5yZXZl
bnRzID0gMDsKKworICAgIGlmIChldi5sTmV0d29ya0V2ZW50cyAmIChGRF9SRUFEIHwgRkRfQUND
RVBUIHwgRkRfT09CKSkgewogICAgICAgICBzc291cmNlLT5yZXZlbnRzIHw9IEdfSU9fSU47CiAg
ICAgfQotICAgIGlmIChGRF9JU1NFVChzc291cmNlLT5zb2NrZXQsICZ3ZmRzKSkgeworCisgICAg
aWYgKGV2LmxOZXR3b3JrRXZlbnRzICYgKEZEX1dSSVRFIHwgRkRfQ09OTkVDVCkpIHsKICAgICAg
ICAgc3NvdXJjZS0+cmV2ZW50cyB8PSBHX0lPX09VVDsKICAgICB9Ci0gICAgaWYgKEZEX0lTU0VU
KHNzb3VyY2UtPnNvY2tldCwgJnhmZHMpKSB7Ci0gICAgICAgIHNzb3VyY2UtPnJldmVudHMgfD0g
R19JT19QUkk7Ci0gICAgfQogCi0gICAgcmV0dXJuIHNzb3VyY2UtPnJldmVudHM7CisgICAgcmV0
dXJuIHNzb3VyY2UtPnJldmVudHMgJiBzc291cmNlLT5jb25kaXRpb247CiB9CiAKIApAQCAtMTc0
LDYgKzE2Nyw3IEBAIHFpb19jaGFubmVsX3NvY2tldF9zb3VyY2VfZmluYWxpemUoR1NvdXJjZSAq
c291cmNlKQogewogICAgIFFJT0NoYW5uZWxTb2NrZXRTb3VyY2UgKnNzb3VyY2UgPSAoUUlPQ2hh
bm5lbFNvY2tldFNvdXJjZSAqKXNvdXJjZTsKIAorCiAgICAgb2JqZWN0X3VucmVmKE9CSkVDVChz
c291cmNlLT5pb2MpKTsKIH0KIApAQCAtMjg2LDkgKzI4MCwxNiBAQCBHU291cmNlICpxaW9fY2hh
bm5lbF9jcmVhdGVfc29ja2V0X3dhdGNoKFFJT0NoYW5uZWwgKmlvYywKICAgICBRSU9DaGFubmVs
U29ja2V0U291cmNlICpzc291cmNlOwogCiAjaWZkZWYgV0lOMzIKLSAgICBXU0FFdmVudFNlbGVj
dChzb2NrZXQsIGlvYy0+ZXZlbnQsCi0gICAgICAgICAgICAgICAgICAgRkRfUkVBRCB8IEZEX0FD
Q0VQVCB8IEZEX0NMT1NFIHwKLSAgICAgICAgICAgICAgICAgICBGRF9DT05ORUNUIHwgRkRfV1JJ
VEUgfCBGRF9PT0IpOworICAgIGludCBldiA9IDA7CisKKyAgICBpZiAoY29uZGl0aW9uICYgR19J
T19JTikgeworICAgICAgICBldiB8PSAoRkRfUkVBRCB8IEZEX0FDQ0VQVCB8IEZEX09PQik7Cisg
ICAgfQorICAgIGlmIChjb25kaXRpb24gJiBHX0lPX09VVCkgeworICAgICAgICBldiB8PSAoRkRf
V1JJVEUgfCBGRF9DT05ORUNUKTsKKyAgICB9CisKKyAgICBXU0FFdmVudFNlbGVjdChzb2NrZXQs
IGlvYy0+ZXZlbnQsIGV2KTsKICNlbmRpZgogCiAgICAgc291cmNlID0gZ19zb3VyY2VfbmV3KCZx
aW9fY2hhbm5lbF9zb2NrZXRfc291cmNlX2Z1bmNzLApAQCAtMzAzLDcgKzMwNCw3IEBAIEdTb3Vy
Y2UgKnFpb19jaGFubmVsX2NyZWF0ZV9zb2NrZXRfd2F0Y2goUUlPQ2hhbm5lbCAqaW9jLAogICAg
IHNzb3VyY2UtPnJldmVudHMgPSAwOwogCiAgICAgc3NvdXJjZS0+ZmQuZmQgPSAoZ2ludHB0cilp
b2MtPmV2ZW50OwotICAgIHNzb3VyY2UtPmZkLmV2ZW50cyA9IEdfSU9fSU47CisgICAgc3NvdXJj
ZS0+ZmQuZXZlbnRzID0gY29uZGl0aW9uOwogCiAgICAgZ19zb3VyY2VfYWRkX3BvbGwoc291cmNl
LCAmc3NvdXJjZS0+ZmQpOwogCi0tIAoyLjI1LjEKCg==
--000000000000f72d0c05e7e99b8b--

