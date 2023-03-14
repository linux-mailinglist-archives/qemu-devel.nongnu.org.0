Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B50A6B892D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 04:51:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbvfr-0001Ct-9i; Mon, 13 Mar 2023 23:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=430a276cf=damien.lemoal@opensource.wdc.com>)
 id 1pbvfn-0001Ar-A2
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 23:50:03 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=430a276cf=damien.lemoal@opensource.wdc.com>)
 id 1pbvfk-0006SJ-Jb
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 23:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678765800; x=1710301800;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bcDdmn0q/ncXsB9fuT6nTVFX7CBoIUBLNkKV2r2aXBA=;
 b=cOqO8xMsZgjnpeubpg2QspnTJcz1oxHvwkuUrVWYN8Z6frOPWqa7C2oL
 kT+z+/9H5DaHI0bCR5cqtkK79+IEiyJEs+bbpHHNf/+SxfZdeEDkARpiN
 he7Vc/FxkxIlgDEra+v7Ft0iQtipDyRitOJuGFWBY5UQmy8W3nx8a9L8f
 tllU31aFurL4gDVyzNBJ4Hhqi4i3VMWzxaf6Hl3zMhtpJ3xwNgpP1ObjR
 HG4iOcRguUACeOrxfhxpOhZf2Ggzb19x5N4+IORPXzWhk+1+li3VnW4Bi
 PH8FN2yJYCL6ekhci4NjSilctCK3JTAR4NexbA/t6KWObWkccn+Y8WeIP w==;
X-IronPort-AV: E=Sophos;i="5.98,258,1673884800"; d="scan'208";a="225566066"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 11:49:49 +0800
IronPort-SDR: vsNuHIeMuImTQbSBo6Jz/zIU4IKn2F42JAfKe5BaiZcNbSZp6N0kpStwmQ70njqNUIm01vi6I9
 0rxVV9ToTwn0jyN1QgWDFXM3gpbJOoNGFffSPbZuLTpzew0rWRHRZEM8sxwsNphU7epU67HACq
 aUAYheUYjLZyAYxWhnVSNLdQm1HyqYdRrjkrzPjaRUD8HkSKaidtxvTG8881EmDC/Pz3QbBwTL
 /bNt9hugKZ+bYsQQpDZLExXpUt0w0LmXqjT3v7Q64I9lB2erjpLdiLup/V5HSSoulRc8WIejAt
 N/E=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 20:00:36 -0700
IronPort-SDR: 6h8N29HAMEbtdU7OXenJfbGvWiXjtP/GYFh3PX1ydNH4m2sr9ryKCz4iRz6nXQ9MpdUpkvOkxn
 qS4j/TKS39LvGqBdRojotJMgZ5Bta/yyxR0gXFzAcTOF1GxmYtbnutbdO0Y8LY/GNdDzf/g31L
 9x+Lpgr5CLiQSbJagmvH2wBx16J61eZ4qU2pEmaUru2WNx+JySwm2gujUtGIhpuQdgSEcpqpYt
 wd+DTuafejlX2AnrDxWQD+lnYHvUX/XUbGsC2grdOgXea48Lj0QJhnsh7ANjVgEhxzKIUdF4Dk
 +rQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 20:49:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PbKKT2tWKz1RtVw
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 20:49:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1678765788; x=1681357789; bh=bcDdmn0q/ncXsB9fuT6nTVFX7CBoIUBLNkK
 V2r2aXBA=; b=FGX98tkCjXvLM3ibPejES3bUb+p42TD1ddGQVnTWwJIm5KKGYir
 v0qMe8YMVU9jOQmahlWI6TmVb7DGgcKJeYdtXKoWF+QVUtFMztNVF7cI7Sdem+Si
 hKdDTpWvu24/k42StOK9uxKxR89LP5skb9b98+NiwN4nEsXBaWCiMJjGPRcpIXP7
 lGX1quXqDsoSkkqJel/s53qJ5omcp+wp4sBSsa0+Z0sZfGLWH9fjJ2akYUAa1Y6t
 NAyJrA1R3CRzyqhjCVSG8kZc5drYP2E4wEHR9Lugq1/rUaiNAN9yN1QptKk725JW
 zIyrIU/niFi0umqS5P4gGSWZtxX21T65LSQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YK2n0KJafqbt for <qemu-devel@nongnu.org>;
 Mon, 13 Mar 2023 20:49:48 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PbKKQ46z9z1RtVm;
 Mon, 13 Mar 2023 20:49:46 -0700 (PDT)
Message-ID: <0ab0bafd-6e21-2f4d-8d73-8c6683b6d1dd@opensource.wdc.com>
Date: Tue, 14 Mar 2023 12:49:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/4] file-posix: add tracking of the zone write pointers
Content-Language: en-US
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "mehta.aaru20@gmail.com" <mehta.aaru20@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "fam@euphon.net"
 <fam@euphon.net>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "jusual@redhat.com"
 <jusual@redhat.com>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
 <20230310103106.62124-2-faithilikerun@gmail.com>
 <e143490361477503b5e7bba43e79f369e3cd7d9b.camel@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <e143490361477503b5e7bba43e79f369e3cd7d9b.camel@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=430a276cf=damien.lemoal@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/14/23 11:23, Dmitry Fomichev wrote:
>> @@ -3339,10 +3473,27 @@ static int coroutine_fn
>> raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
len >> BDRV_SECTOR_BITS);
>> =C2=A0=C2=A0=C2=A0=C2=A0 ret =3D raw_thread_pool_submit(bs, handle_aio=
cb_zone_mgmt, &acb);
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (ret !=3D 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update_zones_wp(s->fd, wps=
, offset, index);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -errno;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report("ioctl %=
s failed %d", op_name, ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> +=C2=A0=C2=A0=C2=A0 if (zo =3D=3D BLKRESETZONE && len =3D=3D capacity)=
 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < bs->=
bl.nr_zones; ++i) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (!BDRV_ZT_IS_CONV(wps->wp[i])) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 wps->wp[i] =3D i * bs->bl.zone_size;
>=20
> This will reset write pointers of all read-only zones that may exist on=
 the
> device and make the data stored in those zones unreadable. R/O zones ne=
ed to be
> skipped in this loop.

And offline zones need to be skipped as well.

--=20
Damien Le Moal
Western Digital Research


