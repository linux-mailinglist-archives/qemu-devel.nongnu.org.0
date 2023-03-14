Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA566B8745
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 01:55:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbsw7-0005ji-Hb; Mon, 13 Mar 2023 20:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>) id 1pbsw4-0005jJ-Tu
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 20:54:40 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>) id 1pbsw3-0005dI-5l
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 20:54:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56025B81185
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 00:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A3BC4339B
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 00:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678755269;
 bh=Uaw4o5fdggC6x634VAi+r1uZnUNEZcmqOTUYgFrpPaw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=q7rY6PDpH98v4XnK4JtFJGT59+Nt3iy7bzDbcEvMwI9uCggkCekGev692wtzJyEmQ
 cllZKqQqw/LzYlzk+1jZul0KMZJMnhPHnE1+AgCAs+DrNq2v55z2LMpVvKONROe7ie
 OTNEIRpbioEXf0om6fbNZ3NOBA2AugnDqkcVVO7SySDSk02/H0C0X45u5AjgJr6wgb
 grpJHQji6enAK9QTzq8Cha1M9C0xmC0T+jvlKHqVfvbzC9FZ3k6YZith7UtN/uHR4+
 jwUpERsc+iGRjGo5UbidnQBonZj0nyF9ZJJj/thRqed9N8zTvx7td6KADnMiH2O0vP
 b/n64UfjVxOxw==
Received: by mail-ed1-f48.google.com with SMTP id y4so26339856edo.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 17:54:28 -0700 (PDT)
X-Gm-Message-State: AO0yUKUeGmkmzeD9jVB0kBNt48lKtCEKkOj+tfHxDPJG1Ix87kzkEx14
 5bVDRTFG7u3KyxE2sto5PBVYxjqixSAuSaDHHIQ=
X-Google-Smtp-Source: AK7set8mq3uFcjdOu+k/q6uk96pQcLevmF54EH2sPeiG5hcXvntBxPRg+0Yaxh8zK89UMUx24nyyRYawwmM8njX75X0=
X-Received: by 2002:a17:906:bc51:b0:923:6595:a81b with SMTP id
 s17-20020a170906bc5100b009236595a81bmr234298ejv.5.1678755267272; Mon, 13 Mar
 2023 17:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-8-alex.bennee@linaro.org>
In-Reply-To: <20230310180332.2274827-8-alex.bennee@linaro.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 14 Mar 2023 08:54:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSXcdsi_CvT3ZayK6n1veUqrkHcFrR_oGwEypqsPw7wvA@mail.gmail.com>
Message-ID: <CAJF2gTSXcdsi_CvT3ZayK6n1veUqrkHcFrR_oGwEypqsPw7wvA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] contrib/gitdm: add Alibaba to the domain-map
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=guoren@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Acked-by: Guo Ren <guoren@kernel.org>

On Sat, Mar 11, 2023 at 2:03=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> This replaces the previous attempt to add c-sky.com so I've dropped
> the review/ack tags. Group everything under Alibaba now.
>
> Added as requested by LIU Zhiwei.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: Guo Ren <guoren@kernel.org>
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


--=20
Best Regards
 Guo Ren

