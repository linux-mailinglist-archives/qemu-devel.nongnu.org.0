Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4748708C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:37:02 +0100 (CET)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5f7l-0008N1-Dn
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:37:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5f5n-0007cg-35
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:34:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5f5l-0002zt-9q
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641522896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnCqH7jHmzZVYeDE/nR0XLA8sI5I0pCVo9/9fbGi3CE=;
 b=MpqjlAkPDnmhzh4xlUXtm0KwvZTNuMVhxXczOce3AlIlzyO786ObJ1nAGbJC9cKQuwdVWY
 DaQjj44/t3gI6nnBEGaHAj5jpnxvuGlmH+1umJzkTLU1f799m2gSlqHKacksooelqhID8+
 uuf4jLPm4K6YZNYR19Qd5PBvIxyTta4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-6bIdi97MO2-KeoJXxLvfsg-1; Thu, 06 Jan 2022 21:34:55 -0500
X-MC-Unique: 6bIdi97MO2-KeoJXxLvfsg-1
Received: by mail-lf1-f69.google.com with SMTP id
 g2-20020a19e042000000b00425cfac0e67so1318473lfj.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 18:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VnCqH7jHmzZVYeDE/nR0XLA8sI5I0pCVo9/9fbGi3CE=;
 b=jz1PDOLf8ZjVbsdGefvx+XGwLirjzMUiDiHPvsW8Xc+wf6pwRIGAuGNbVARHSGcAsa
 WmxkDuVQXXE+KyJYlm1130+DxIHLP7NAvatlSmSilPCg78ct9/4ZKtIS6Fq8sepjp61d
 8jACgHhaZylJgKO0SOg83Tkrc65JvNbAgxoWeULDrkjecvSFJb2cKzIUeYz5t0XUMtNq
 9WB6GxVeSpw4SC23aQLOLo66w2bFgsCRJpRDLjgZJWEFGZ93PCOTewzAihKptWtwCHCJ
 pqW6QPRKUyI7PPJYtAcBjeYWRJ17rzFhRkSPhpmmuXWkdbhfPhUf1yAyWf71G4mgxWJq
 mBjg==
X-Gm-Message-State: AOAM5335NFr27k3EykdenebTCDGRSLQhnbHoxQK74sTUmA1j9cNYrLui
 IwxA2iEZbdrfcIdEZkkn/N9dIRvAe/E4YByT6cC8tmivDPFnO/nHDqScGQfqSeK+UMyGSwngFbo
 R5VHtqau5aMr42zZda6huFR2/6ZXxrlE=
X-Received: by 2002:a05:6512:22d6:: with SMTP id
 g22mr54340514lfu.199.1641522892723; 
 Thu, 06 Jan 2022 18:34:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBR1Rvj1OOju9BfrE17kVL0CaaK7aynPHshrolE9P4SgPa4vXLIGFaxU1CWSaBcnLWCrwEfTazx+B9S5XgHik=
X-Received: by 2002:a05:6512:22d6:: with SMTP id
 g22mr54340500lfu.199.1641522892446; 
 Thu, 06 Jan 2022 18:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20220106182851.3583896-1-venture@google.com>
 <051681aa-5a02-d096-f5e2-be828407face@amsat.org>
In-Reply-To: <051681aa-5a02-d096-f5e2-be828407face@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 7 Jan 2022 10:34:41 +0800
Message-ID: <CACGkMEtsC67+MC_7vffu8=JxDXy6y0tkGWnObHQEVPDQmrDOsQ@mail.gmail.com>
Subject: Re: [PATCH] net: Fix uninitialized data usage
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 Peter Foley <pefoley@google.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 7, 2022 at 3:44 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 6/1/22 19:28, Patrick Venture wrote:
> > From: Peter Foley <pefoley@google.com>
> >
> > e.g.
> > 1109 15:16:20.151506 Uninitialized bytes in ioctl_common_pre at offset =
0 inside [0x7ffc516af9b8, 4)
> >   1109 15:16:20.151659 =3D=3D588974=3D=3DWARNING: MemorySanitizer: use-=
of-uninitialized-value
> >   1109 15:16:20.312923     #0 0x5639b88acb21 in tap_probe_vnet_hdr_len =
third_party/qemu/net/tap-linux.c:183:9
> >   1109 15:16:20.312952     #1 0x5639b88afd66 in net_tap_fd_init third_p=
arty/qemu/net/tap.c:409:9
> >   1109 15:16:20.312954     #2 0x5639b88b2d1b in net_init_tap_one third_=
party/qemu/net/tap.c:681:19
> >   1109 15:16:20.312956     #3 0x5639b88b16a8 in net_init_tap third_part=
y/qemu/net/tap.c:912:13
> >   1109 15:16:20.312957     #4 0x5639b8890175 in net_client_init1 third_=
party/qemu/net/net.c:1110:9
> >   1109 15:16:20.312958     #5 0x5639b888f912 in net_client_init third_p=
arty/qemu/net/net.c:1208:15
> >   1109 15:16:20.312960     #6 0x5639b8894aa5 in net_param_nic third_par=
ty/qemu/net/net.c:1588:11
> >   1109 15:16:20.312961     #7 0x5639b900cd18 in qemu_opts_foreach third=
_party/qemu/util/qemu-option.c:1135:14
> >   1109 15:16:20.312962     #8 0x5639b889393c in net_init_clients third_=
party/qemu/net/net.c:1612:9
> >   1109 15:16:20.312964     #9 0x5639b717aaf3 in qemu_create_late_backen=
ds third_party/qemu/softmmu/vl.c:1962:5
> >   1109 15:16:20.312965     #10 0x5639b717aaf3 in qemu_init third_party/=
qemu/softmmu/vl.c:3694:5
> >   1109 15:16:20.312967     #11 0x5639b71083b8 in main third_party/qemu/=
softmmu/main.c:49:5
> >   1109 15:16:20.312968     #12 0x7f464de1d8d2 in __libc_start_main (/us=
r/grte/v5/lib64/libc.so.6+0x628d2)
> >   1109 15:16:20.312969     #13 0x5639b6bbd389 in _start /usr/grte/v5/de=
bug-src/src/csu/../sysdeps/x86_64/start.S:120
> >   1109 15:16:20.312970
> >   1109 15:16:20.312975   Uninitialized value was stored to memory at
> >   1109 15:16:20.313393     #0 0x5639b88acbee in tap_probe_vnet_hdr_len =
third_party/qemu/net/tap-linux.c
> >   1109 15:16:20.313396     #1 0x5639b88afd66 in net_tap_fd_init third_p=
arty/qemu/net/tap.c:409:9
> >   1109 15:16:20.313398     #2 0x5639b88b2d1b in net_init_tap_one third_=
party/qemu/net/tap.c:681:19
> >   1109 15:16:20.313399     #3 0x5639b88b16a8 in net_init_tap third_part=
y/qemu/net/tap.c:912:13
> >   1109 15:16:20.313400     #4 0x5639b8890175 in net_client_init1 third_=
party/qemu/net/net.c:1110:9
> >   1109 15:16:20.313401     #5 0x5639b888f912 in net_client_init third_p=
arty/qemu/net/net.c:1208:15
> >   1109 15:16:20.313403     #6 0x5639b8894aa5 in net_param_nic third_par=
ty/qemu/net/net.c:1588:11
> >   1109 15:16:20.313404     #7 0x5639b900cd18 in qemu_opts_foreach third=
_party/qemu/util/qemu-option.c:1135:14
> >   1109 15:16:20.313405     #8 0x5639b889393c in net_init_clients third_=
party/qemu/net/net.c:1612:9
> >   1109 15:16:20.313407     #9 0x5639b717aaf3 in qemu_create_late_backen=
ds third_party/qemu/softmmu/vl.c:1962:5
> >   1109 15:16:20.313408     #10 0x5639b717aaf3 in qemu_init third_party/=
qemu/softmmu/vl.c:3694:5
> >   1109 15:16:20.313409     #11 0x5639b71083b8 in main third_party/qemu/=
softmmu/main.c:49:5
> >   1109 15:16:20.313410     #12 0x7f464de1d8d2 in __libc_start_main (/us=
r/grte/v5/lib64/libc.so.6+0x628d2)
> >   1109 15:16:20.313412     #13 0x5639b6bbd389 in _start /usr/grte/v5/de=
bug-src/src/csu/../sysdeps/x86_64/start.S:120
> >   1109 15:16:20.313413
> >   1109 15:16:20.313417   Uninitialized value was stored to memory at
> >   1109 15:16:20.313791     #0 0x5639b88affbd in net_tap_fd_init third_p=
arty/qemu/net/tap.c:400:26
> >   1109 15:16:20.313826     #1 0x5639b88b2d1b in net_init_tap_one third_=
party/qemu/net/tap.c:681:19
> >   1109 15:16:20.313829     #2 0x5639b88b16a8 in net_init_tap third_part=
y/qemu/net/tap.c:912:13
> >   1109 15:16:20.313831     #3 0x5639b8890175 in net_client_init1 third_=
party/qemu/net/net.c:1110:9
> >   1109 15:16:20.313836     #4 0x5639b888f912 in net_client_init third_p=
arty/qemu/net/net.c:1208:15
> >   1109 15:16:20.313838     #5 0x5639b8894aa5 in net_param_nic third_par=
ty/qemu/net/net.c:1588:11
> >   1109 15:16:20.313839     #6 0x5639b900cd18 in qemu_opts_foreach third=
_party/qemu/util/qemu-option.c:1135:14
> >   1109 15:16:20.313841     #7 0x5639b889393c in net_init_clients third_=
party/qemu/net/net.c:1612:9
> >   1109 15:16:20.313843     #8 0x5639b717aaf3 in qemu_create_late_backen=
ds third_party/qemu/softmmu/vl.c:1962:5
> >   1109 15:16:20.313844     #9 0x5639b717aaf3 in qemu_init third_party/q=
emu/softmmu/vl.c:3694:5
> >   1109 15:16:20.313845     #10 0x5639b71083b8 in main third_party/qemu/=
softmmu/main.c:49:5
> >   1109 15:16:20.313846     #11 0x7f464de1d8d2 in __libc_start_main (/us=
r/grte/v5/lib64/libc.so.6+0x628d2)
> >   1109 15:16:20.313847     #12 0x5639b6bbd389 in _start /usr/grte/v5/de=
bug-src/src/csu/../sysdeps/x86_64/start.S:120
> >   1109 15:16:20.313849
> >   1109 15:16:20.313851   Uninitialized value was created by an allocati=
on of 'ifr' in the stack frame of function 'tap_probe_vnet_hdr'
> >   1109 15:16:20.313855     #0 0x5639b88ac680 in tap_probe_vnet_hdr thir=
d_party/qemu/net/tap-linux.c:151
> >   1109 15:16:20.313856
> >   1109 15:16:20.313878 SUMMARY: MemorySanitizer: use-of-uninitialized-v=
alue third_party/qemu/net/tap-linux.c:183:9 in tap_probe_vnet_hdr_len
> >
> > Fixes: dc69004c7d8 ("net: move tap_probe_vnet_hdr() to tap-linux.c")
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Signed-off-by: Peter Foley <pefoley@google.com>
> > ---
> >   net/tap-linux.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/net/tap-linux.c b/net/tap-linux.c
> > index 9584769740..5e70b93037 100644
> > --- a/net/tap-linux.c
> > +++ b/net/tap-linux.c
> > @@ -150,6 +150,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions =
*tap, Error **errp)
> >   int tap_probe_vnet_hdr(int fd, Error **errp)
> >   {
> >       struct ifreq ifr;
> > +    memset(&ifr, 0, sizeof(ifr));
>
> Or:
>
>         struct ifreq ifr =3D { };
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Applied.

Thanks

>
> >
> >       if (ioctl(fd, TUNGETIFF, &ifr) !=3D 0) {
> >           /* TUNGETIFF is available since kernel v2.6.27 */
>


