Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E56B6D31
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 02:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbXIg-0003Ld-PV; Sun, 12 Mar 2023 21:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pbXIe-0003L9-9W
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 21:48:32 -0400
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pbXIb-0007KO-GN
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 21:48:32 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VdeeQ5a_1678672093; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VdeeQ5a_1678672093) by smtp.aliyun-inc.com;
 Mon, 13 Mar 2023 09:48:13 +0800
Message-ID: <1678672078.526416-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2 07/10] contrib/gitdm: add Alibaba to the domain-map
Date: Mon, 13 Mar 2023 09:47:58 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
 qemu-devel@nongnu.org
References: <20230310180332.2274827-8-alex.bennee@linaro.org>
In-Reply-To: <20230310180332.2274827-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, 10 Mar 2023 18:03:29 +0000, =3D?utf-8?q?Alex_Benn=3DC3=3DA9e?=3D <a=
lex.bennee@linaro.org> wrote:
> This replaces the previous attempt to add c-sky.com so I've dropped
> the review/ack tags. Group everything under Alibaba now.
>
> Added as requested by LIU Zhiwei.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: Guo Ren <guoren@kernel.org>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Thanks.



> ---
>  contrib/gitdm/domain-map        | 1 +
>  contrib/gitdm/group-map-alibaba | 7 +++++++
>  gitdm.config                    | 1 +
>  3 files changed, 9 insertions(+)
>  create mode 100644 contrib/gitdm/group-map-alibaba
>
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 0261533990..e678c23a9c 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -4,6 +4,7 @@
>  # This maps email domains to nice easy to read company names
>  #
>
> +linux.alibaba.com Alibaba
>  amazon.com      Amazon
>  amazon.co.uk    Amazon
>  amd.com         AMD
> diff --git a/contrib/gitdm/group-map-alibaba b/contrib/gitdm/group-map-al=
ibaba
> new file mode 100644
> index 0000000000..0ebbe6b06e
> --- /dev/null
> +++ b/contrib/gitdm/group-map-alibaba
> @@ -0,0 +1,7 @@
> +#
> +# Alibaba contributors including its subsidiaries
> +#
> +
> +# c-sky.com, now part of T-Head, wholly-owned entity of Alibaba Group
> +ren_guo@c-sky.com
> +zhiwei_liu@c-sky.com
> diff --git a/gitdm.config b/gitdm.config
> index 4b52ee47be..6908ddbd19 100644
> --- a/gitdm.config
> +++ b/gitdm.config
> @@ -31,6 +31,7 @@ EmailMap contrib/gitdm/domain-map
>  # identifiable corporate emails. Please keep this list sorted.
>  #
>
> +GroupMap contrib/gitdm/group-map-alibaba Alibaba
>  GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
>  GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
>  GroupMap contrib/gitdm/group-map-facebook Facebook
> --
> 2.39.2
>

