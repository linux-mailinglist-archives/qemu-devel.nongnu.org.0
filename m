Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0EA6BBEFD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 22:25:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcYbY-0007QO-BG; Wed, 15 Mar 2023 17:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4318cbe24=damien.lemoal@opensource.wdc.com>)
 id 1pcYbV-0007PO-In
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 17:24:13 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4318cbe24=damien.lemoal@opensource.wdc.com>)
 id 1pcYbS-0007Bq-GX
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 17:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678915450; x=1710451450;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6/f34pOlzMsamVBhB/pDpnT+wCbdZZDPuQWhHlSMb+4=;
 b=GyF11VaQOvABciXBSH82otFrtgHywVbkV04Si83VaE2MAOK3nCk6kdFI
 VNQkO8upZ6N/BLNrqKFGmgaExcgGpYS00sul5JVIxM8SEOw7ab4HDMXMJ
 YXXewUIEBpLnL8mW0V6TqYqe7KfQWh+2G7ZuAQhpFA+goq000LlZliYLI
 szU2Xq/Z3g+hVL/FltTgyHLp2N0eIFHmf2FHP6ZKkVAh3kdWK16GYWEXF
 A4cJtW8l/yXQFnlfRLiAcKhRoGMwz+aCWEtbvDn7jw2T1KhKNPIGyX3JN
 iKJBXrusnQ1UMhroIFzUMkoo22cP4qfh6CzPWwkw0Rcn4CJIgOm1Je1Gj g==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673884800"; d="scan'208";a="225723686"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2023 05:24:00 +0800
IronPort-SDR: 1U4inDE1mnFRLUzKVzuhWcS8RDufYDj1j4kWc+5iuZg2YWHbF/P0s9ljFj17F/qmX3jykfKmZg
 SE16OW+dX01HrGr5rra8U56sz21fxI9gES95rZMA0X43AbSeLH82+NaRZyV0lUFmEbbsLQIQ1g
 ELNQr8Aebbpp46emxO+nSVmuIQSZNwu3rwGW4iuLlO59+FLXuHvKBytIEeVNseBkdEXJQXkmmH
 vzMo4BfKoVL3RqKchMLbXvf0rXfxV4jFCrzGsufhe4RtiFhn3K2+TniBCDgtX9zZlGo4fEiEJP
 yI0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 13:40:25 -0700
IronPort-SDR: KaGGFX3F25IuJZTj2LVxm9ecdk3yub/Hj4RDutMeaW/Fvb0eLFTg7bIxS4IORnL8NmJQgUQWXM
 BIJQ/jG6B4IxN/Zq+CuyjtF8oF8drgozLKdqTQxBpHZRTbvzqzfZ9qxaNhesqsIzPLPiZFUm0e
 nYETSgAI4AQUvSPevAhh3YFe/IOaP6n0MPTyeBvuv+0Jo8sNQv3LEz6Mee06+s4zZKce8vgZ49
 vd0zwGCGHYc3C3Dm55Jbxf37Y4NDtR1Z+UAw0aQ7EFKUMUhbbteqpEoEnbWRtjgnmfcJc/IfLm
 lFo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 14:24:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PcNgM6qFLz1RtW2
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 14:23:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1678915438; x=1681507439; bh=6/f34pOlzMsamVBhB/pDpnT+wCbdZZDPuQW
 hHlSMb+4=; b=jUNnZHcnhUpWauctmGbhpORm8o0codEp95a3b4vkmGKHbVefXzd
 LafBSko6aeM3EcNrfMFOvcSMzvhrmW3WwWTP2J1PONFUP6h0EKrrM+E1Sd+9BrUY
 oT4Stke9bHZXc4yGZqQwXi3JioIac8EUROtRR7X9SKM8BjaPYgttjX4oohEPwRbN
 tNhkNYULj1lHxZl/uLZOt9yNCdKszF8+eEosKrrCHwLjnORTkfbXt2Daq0AqIrdk
 sTvvhHWF47JmdfpZHkzgweQMS94co8vNtGiAMZpVjXSo8uA9uola2SEpdbojkcQo
 FCzwevDbKRxBjSGmi86XwTsyNLGCfHNPJcw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id sUP6M5IbyDmg for <qemu-devel@nongnu.org>;
 Wed, 15 Mar 2023 14:23:58 -0700 (PDT)
Received: from [10.225.163.84] (unknown [10.225.163.84])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PcNgJ73pHz1RtVm;
 Wed, 15 Mar 2023 14:23:56 -0700 (PDT)
Message-ID: <a191cacc-121b-717c-d30d-d1003344be39@opensource.wdc.com>
Date: Thu, 16 Mar 2023 06:23:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/4] file-posix: add tracking of the zone write pointers
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "mehta.aaru20@gmail.com" <mehta.aaru20@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "fam@euphon.net"
 <fam@euphon.net>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "jusual@redhat.com"
 <jusual@redhat.com>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
 <20230310103106.62124-2-faithilikerun@gmail.com>
 <e143490361477503b5e7bba43e79f369e3cd7d9b.camel@wdc.com>
 <0ab0bafd-6e21-2f4d-8d73-8c6683b6d1dd@opensource.wdc.com>
 <CAAAx-8+9xaCuYtJCRuvVtMV1czdO6pOCPR6Dirpzf0N0-H6jgg@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8+9xaCuYtJCRuvVtMV1czdO6pOCPR6Dirpzf0N0-H6jgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=4318cbe24=damien.lemoal@opensource.wdc.com;
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

On 3/15/23 21:59, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2023=E5=B9=B4=
3=E6=9C=8814=E6=97=A5=E5=91=A8=E4=BA=8C 11:49=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 3/14/23 11:23, Dmitry Fomichev wrote:
>>>> @@ -3339,10 +3473,27 @@ static int coroutine_fn
>>>> raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>>>>                          len >> BDRV_SECTOR_BITS);
>>>>      ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb=
);
>>>>      if (ret !=3D 0) {
>>>> +        update_zones_wp(s->fd, wps, offset, index);
>>>>          ret =3D -errno;
>>>>          error_report("ioctl %s failed %d", op_name, ret);
>>>> +        goto out;
>>>>      }
>>>>
>>>> +    if (zo =3D=3D BLKRESETZONE && len =3D=3D capacity) {
>>>> +        for (int i =3D 0; i < bs->bl.nr_zones; ++i) {
>>>> +            if (!BDRV_ZT_IS_CONV(wps->wp[i])) {
>>>> +                wps->wp[i] =3D i * bs->bl.zone_size;
>>>
>>> This will reset write pointers of all read-only zones that may exist =
on the
>>> device and make the data stored in those zones unreadable. R/O zones =
need to be
>>> skipped in this loop.
>>
>> And offline zones need to be skipped as well.
>=20
> I see. That can be done thanks to get_zones_wp() which can show the
> state of the zone at specific position.

I do not think so: a zone wp is invalid for read-only and offline zones. =
So you
cannot rely on the wp value to detect these states. Even a valid wp value=
 would
not tell you if the zone is read only or offline anyway. You need to trac=
k these
states with flags set when doing the first report zone on startup and whe=
n doing
a report zone after an IO error.

>=20
> Sam

--=20
Damien Le Moal
Western Digital Research


