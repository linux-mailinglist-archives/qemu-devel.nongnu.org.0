Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2605961B1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:59:52 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0r1-0005CU-5e
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0n5-0007lU-LV
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:55:48 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:64893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0n3-0005UW-GH
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660672545; x=1692208545;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DdSZB7kqEoHdYhKrWtEdOIFqvxg7TVcCR26zqT46a5g=;
 b=HPvnqrBOQAAeXq532EPzKi+CuxZQtFWnugu6DzA+8iU07KtnjQzh2oFj
 WkW17Cu9q90YODVB4Tgn12O/VCIpko2+H6KNcqV3Cug+VwiyXur+HbkAl
 eE7J5RxCu+DimsuO6v9GMIgCUekx4fQexFqBqkynSkGLuNecilp8i4bfh
 T2LhXLq8NXjdjyi5Jb37DkDhH3qyy7Lso0fR4or/Fl1B2SjO+bbcaxSI1
 VXNEwf8H7BXWFlOhWtVloh6NGuRxtBPmtwEmHdi76pOybICTm9176Hngp
 n6UNIwlVrTuZQOkQGLg0hDlyBMGXsHNlbnAzbYz/ck0kPXkqOS9Bz5b5f g==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654531200"; d="scan'208";a="320954181"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Aug 2022 01:55:41 +0800
IronPort-SDR: gCfsBNVlYp+TNV5llLgpi/0dUWtFsOxLHl7FQOYsb7NsRT+282UIxlBVQZHvSY7zirWebtjlMN
 2/GN3QNhLa1CbRHGFLWcOyVgpTPxgJefPq96mMReL1KIbjfadjZU0NXMsvLRjxVhwENZgyPvYB
 BJ49p7YAXs7eTyoAKGFOE7uyq/YRURD5cJl7xjDA7qlwzL89o/K1H/2oCAlCHynyi4AUqXo44N
 VaD2ndvNr6yr9rSiBnsdofzuvJl5vgObUCJTYd8yIv+/6eIDwhmseblHuKQZSNu+lAkuKtnLDk
 fha54lfScNJNNrZiiKYlWIWD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 10:16:29 -0700
IronPort-SDR: QiLsBCs9C04gnQYd0vIgDFhTxECXTnIa9WfVnSuPnIldCVX4jx4aSTMn7tcRqRo1FBIGXzKBte
 mITOVk6W59h8I+xXVNSKPnlZvhJbNrrjtlMVNm3k5/HFlQDvRm+g2PVohiwVqsILCHTfQlxTCx
 4QrSDgV4+tFF2hIqdzt8Qjmht8zzusHigDpR/O0nPc+1hfErKcfPpUIFMX6wSxp+I8wldmaEGs
 l6ei3k7Wvr9Em0p1MpMNTPU80W7vdZQQlMa3eZlOojxfyyJF7Qt8Qne7SSgosAGDoXj/E9edqo
 hI8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 10:55:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M6f2P3spSz1RwqM
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 10:55:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1660672540; x=1663264541; bh=DdSZB7kqEoHdYhKrWtEdOIFqvxg7TVcCR26
 zqT46a5g=; b=Tdq3t4Upx+Okxv0RMoTH7DerIUl/oXeJJzFUOwgf+1nywYoMTyo
 SQ0BhAEZ4oBPuHobCZ49qmvobUgrwxxUFctGoe9LSx86QUh7sueAn7BMJuNEmWuE
 GKO6jXOiwMCpraR96S2mhI3rg5E4NuPzfcipcfLL3pBPEL6hhBZIovOdjmPM4q00
 p9w4y3HE7MOhUXwwSn6ivG/IZJraDn7Y+5e6EVQ+P7Eea2Uz+ECk+nuPsSTTtVTd
 Xdi61QS8KAJGz6Um3G//2KjDlCbUenbLIFMJdAcryDtO2Se11hL3nahQzxdUaZ5V
 GhPFSM8yRbg0wgobXMeQmClANpmJxPYKLNQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Y3QZDac9qjhP for <qemu-devel@nongnu.org>;
 Tue, 16 Aug 2022 10:55:40 -0700 (PDT)
Received: from [10.111.64.29] (c02drav6md6t.sdcorp.global.sandisk.com
 [10.111.64.29])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M6f2N1d1qz1RtVk;
 Tue, 16 Aug 2022 10:55:40 -0700 (PDT)
Message-ID: <fbdebf32-fc26-4b23-3bc9-aeba0020535f@opensource.wdc.com>
Date: Tue, 16 Aug 2022 10:55:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v7 3/8] file-posix: introduce get_sysfs_long_val for the
 long sysfs attribute
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu block <qemu-block@nongnu.org>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-4-faithilikerun@gmail.com>
 <69f2b5bd-2312-a581-7ce1-065159eeaf5d@opensource.wdc.com>
 <CAAAx-8+j=HrzhzHDzdE+LWKay6fRkvqugk+1CTb-zAc8ZxpFrg@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8+j=HrzhzHDzdE+LWKay6fRkvqugk+1CTb-zAc8ZxpFrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=22053a6f0=damien.lemoal@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 2022/08/16 10:53, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B4=
8=E6=9C=8817=E6=97=A5=E5=91=A8=E4=B8=89 01:35=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 2022/08/15 23:25, Sam Li wrote:
>>> Use sysfs attribute files to get the long value of zoned device
>>> information.
>>>
>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>  block/file-posix.c | 27 +++++++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index c07ac4c697..727389488c 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -1258,6 +1258,33 @@ static int get_sysfs_zoned_model(struct stat *=
st, BlockZoneModel *zoned) {
>>>      return 0;
>>>  }
>>>
>>> +/*
>>> + * Get zoned device information (chunk_sectors, zoned_append_max_byt=
es,
>>> + * max_open_zones, max_active_zones) through sysfs attribute files.
>>> + */
>>
>> The comment here needs to be more generic since this helper is used in=
 patch 2
>> in hdev_get_max_segments(). So simply something like:
>>
>> /*
>>  * Get a sysfs attribute value as a long integer.
>>  */
>>
>> And since this helper is used in patch 2, this patch needs to go befor=
e patch 2
>> (reverse patch 2 and 3 order).
>=20
> Can I merge patch2 and patch 3 into one patch? Because in patch 2
> hdev_get_max_segments -> get_sysfs_long_val(-> get_sysfs_str_val)
> while in patch 3 get_sysfs_long_val-> get_sysfs_str_val,
> hdev_get_max_segments is required for qemu setting up I guess so the
> dependency is intertwined here. If we use separate patches, then the
> last patch will modify the first patch's code, which I think is messy.

Indeed. So merge the 2 patches to solve this. Rework the commit message t=
oo to
mention the introduction of the get_sysfs_long_val() helper.

>=20
>>
>>> +static long get_sysfs_long_val(struct stat *st, const char *attribut=
e) {
>>> +#ifdef CONFIG_LINUX
>>> +    g_autofree char *str =3D NULL;
>>> +    const char *end;
>>> +    long val;
>>> +    int ret;
>>> +
>>> +    ret =3D get_sysfs_str_val(st, attribute, &str);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    /* The file is ended with '\n', pass 'end' to accept that. */
>>> +    ret =3D qemu_strtol(str, &end, 10, &val);
>>> +    if (ret =3D=3D 0 && end && *end =3D=3D '\n') {
>>> +        ret =3D val;
>>> +    }
>>> +    return ret;
>>> +#else
>>> +    return -ENOTSUP;
>>> +#endif
>>> +}
>>> +
>>>  static int hdev_get_max_segments(int fd, struct stat *st) {
>>>      int ret;
>>>      if (S_ISCHR(st->st_mode)) {
>>
>>
>> --
>> Damien Le Moal
>> Western Digital Research


--=20
Damien Le Moal
Western Digital Research

