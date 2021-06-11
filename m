Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF103A4796
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:13:08 +0200 (CEST)
Received: from localhost ([::1]:57462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkiR-0006nO-S5
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lrkgu-00057t-9Q
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lrkgq-0006jx-9F
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623431486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faZiY9CBWOOT8+CVaXaCxoDyjKcQOovdZIJW7qnUfxE=;
 b=CpMZ6O2taYqNyCnIrAmIdO2lS4kWYtIhPXYcYLbFiQc6auRJBk7RF8DYh4xyzXTIjPrDZT
 NGJ8GJUKL1oZqGZXfjE/q8RWMfZqlEO98RFk3tY4/qtzj+4CCbn+N6QW56h5+jzHHTxOQf
 war/pogFMmIDJEisBCF/BOJEahBlS2k=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-eZNMZgRpOb-LDQL6AzaPMA-1; Fri, 11 Jun 2021 13:11:25 -0400
X-MC-Unique: eZNMZgRpOb-LDQL6AzaPMA-1
Received: by mail-pl1-f197.google.com with SMTP id
 x15-20020a170902e04fb02900f5295925dbso2987069plx.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 10:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=faZiY9CBWOOT8+CVaXaCxoDyjKcQOovdZIJW7qnUfxE=;
 b=bNd1Y5vnd1p7Che3yUQh2qmX7tA8TO6420uWm4rjgVYlEA02dfOutTczrVuETx0jir
 cOzTHuaOQhmdUrcTm2kGN9dO1nl1W1J+AlCsyCkwWSw7Z0/UqIHUcPpnzbY6yE28CRcL
 eRaUrtjkLaJ8+tBLD2sfxO3a4jzsDRFKhJBI1I4KEVV4/Ady12TQB0RWt5xtkdrskTXb
 J30p9gLPTDs3CLKJX20oBN42OiM4vagL0N0C9FYebi7qfa+juRwVYBRClcOPAd94rQos
 I8LG8b0lefksKGby7TRPMeJlQ1OCjvJBgDC/Ibb2aS3RyeZ6mEootXWzgqPB0LGYRcIg
 KKHg==
X-Gm-Message-State: AOAM532Xy+pJbOnrup3yDmV1oYyjn6p6toUPoRg4XGha52okZC4VCSdg
 GdSkPwN0HPrsrFTITM1/JkingxEkh3Tcw7E1iAKJByMkVH9fHhoaEPtGPvUqkVI6KXVsllZLNN5
 PD8EdoL9bWbGOd9ryOubNirVDJ1XAzGY=
X-Received: by 2002:a17:90a:4a12:: with SMTP id
 e18mr5512482pjh.213.1623431484446; 
 Fri, 11 Jun 2021 10:11:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvdaZBrUrUt0A0Z0GY/+VhnI/OQRI2Qsfa4ZjIEUi69KYgEnR6eIL0WVyZ9s0d914Iz9ADuxD1kQk9Fa9KXLY=
X-Received: by 2002:a17:90a:4a12:: with SMTP id
 e18mr5512459pjh.213.1623431484160; 
 Fri, 11 Jun 2021 10:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210611164305.440633-1-mcascell@redhat.com>
In-Reply-To: <20210611164305.440633-1-mcascell@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 11 Jun 2021 19:11:13 +0200
Message-ID: <CAA8xKjXFRtk0eigXtAtku6wQpCcHCr8hx1FL1dn=pu8yzxWuDQ@mail.gmail.com>
Subject: Re: [PATCH v2] Test comment for git-publish
To: Mauro Matteo Cascella <mcascell@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 6:43 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> ---
>  hw/rdma/vmw/pvrdma_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 84ae8024fc..e229c19564 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -427,7 +427,7 @@ static void pvrdma_regs_write(void *opaque, hwaddr addr, uint64_t val,
>      case PVRDMA_REG_REQUEST:
>          if (val == 0) {
>              trace_pvrdma_regs_write(addr, val, "REQUEST", "");
> -            pvrdma_exec_cmd(dev);
> +            pvrdma_exec_cmd(dev); // this is a test comment
>          }
>          break;
>      default:
> --
> 2.31.1
>

Again, sorry for the spam. Can someone please explain how to *not* use
the profiles defined in .gitpublish? I used the following command,
evidently with no success:

$ git publish --override-cc --override-to --to=mcascell@redhat.com

-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


