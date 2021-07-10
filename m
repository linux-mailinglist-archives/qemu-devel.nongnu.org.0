Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F003C36CD
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 22:34:57 +0200 (CEST)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Jge-0000Wp-Ow
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 16:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m2Je9-0004wA-J6
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 16:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m2Je5-0001Xk-Kd
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 16:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625949131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vK/k+IFVP1J4jdM2NFzS1evc2TAHZuSfCTiZIbMJz6E=;
 b=f+Pz+jdyqAxL9ADnBRnUXyNptH3ET5V51EVxuAYadWohbiCmxEQoITGyIbYEsz8v93dko1
 N+svaWF9z9lYMIUQQnGL/TgY/lRKB7rU3pDJV6Vz+ll2VGFzmODs3dvA1rxvoI4WeyU+RD
 6LZTCmjX82jEiw0rA9WRKtLf08K1nKM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-zwqGdGJCOhOnMvS1zMRutA-1; Sat, 10 Jul 2021 16:32:10 -0400
X-MC-Unique: zwqGdGJCOhOnMvS1zMRutA-1
Received: by mail-ed1-f70.google.com with SMTP id
 x16-20020aa7d6d00000b02903a2e0d2acb7so2437443edr.16
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 13:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vK/k+IFVP1J4jdM2NFzS1evc2TAHZuSfCTiZIbMJz6E=;
 b=buHmAhoMKSB0NNCsppPICMrtr5d5Q32oY3X0xeyUoyXcmWXe6zrkF6QIB7Llv+BN/j
 1y+xMYzYV4DZgvaOO7g/XA5iKjH+kEpXsX6mp7VAdHQ6K5MCckBIzNKhhapp1taP5tnx
 R8GD2j7iBXTmFh007OvtyKC2ZyEV+2PGyRm2oq2IiBKFfua8hrS/nHW05Ca5AH8yA2CB
 JRubY68rXwLQ0n2FBDGyjUKiCdf9YwZSY6ktUf8DJJJ+fFuUU4BxYd3irEfzC/BjCt2Q
 nMDtcNy+nL45WdH4cLm98oa6YnD0vnFcX3VqETKQ5LYjZQDJbdUXk8xkt2cFcvygyBal
 92UQ==
X-Gm-Message-State: AOAM531ponV/7x51wEEW/P5cvG6CrpVQAX+g7kYKvn/Mf/Q5p/yVYSPL
 uBneqgFQP3qfBKYvKqABuW7IM9qjwfty74nejcB28bVvk3nWsUaTa6NJgbwO7/Xg/JZ0DJJtovs
 4ZfH+SqHeq4PiN78=
X-Received: by 2002:a05:6402:510d:: with SMTP id
 m13mr55138870edd.179.1625949129549; 
 Sat, 10 Jul 2021 13:32:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhBwV7xiuVieW6MsUcGkhFQKl8z4jMbj40gGsYJmhV/Gd78VG37WlnmLQf5XiejMjuLtS/tw==
X-Received: by 2002:a05:6402:510d:: with SMTP id
 m13mr55138839edd.179.1625949129363; 
 Sat, 10 Jul 2021 13:32:09 -0700 (PDT)
Received: from redhat.com ([2.55.136.76])
 by smtp.gmail.com with ESMTPSA id jg9sm2390624ejc.6.2021.07.10.13.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 13:32:08 -0700 (PDT)
Date: Sat, 10 Jul 2021 16:32:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [RFC PATCH 1/6] linux-header: add the SNP specific command
Message-ID: <20210710163148-mutt-send-email-mst@kernel.org>
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-2-brijesh.singh@amd.com>
MIME-Version: 1.0
In-Reply-To: <20210709215550.32496-2-brijesh.singh@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.452,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 04:55:45PM -0500, Brijesh Singh wrote:
> Sync the kvm.h with the kernel to include the SNP specific commands.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>

Pls specify which kernel version you used for the sync.

> ---
>  linux-headers/linux/kvm.h | 47 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 20d6a263bb..c17ace1ece 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1679,6 +1679,12 @@ enum sev_cmd_id {
>  	/* Guest Migration Extension */
>  	KVM_SEV_SEND_CANCEL,
>  
> +	/* SNP specific commands */
> +	KVM_SEV_SNP_INIT = 256,
> +	KVM_SEV_SNP_LAUNCH_START,
> +	KVM_SEV_SNP_LAUNCH_UPDATE,
> +	KVM_SEV_SNP_LAUNCH_FINISH,
> +
>  	KVM_SEV_NR_MAX,
>  };
>  
> @@ -1775,6 +1781,47 @@ struct kvm_sev_receive_update_data {
>  	__u32 trans_len;
>  };
>  
> +struct kvm_snp_init {
> +	__u64 flags;
> +};
> +
> +struct kvm_sev_snp_launch_start {
> +	__u64 policy;
> +	__u64 ma_uaddr;
> +	__u8 ma_en;
> +	__u8 imi_en;
> +	__u8 gosvw[16];
> +};
> +
> +#define KVM_SEV_SNP_PAGE_TYPE_NORMAL		0x1
> +#define KVM_SEV_SNP_PAGE_TYPE_VMSA		0x2
> +#define KVM_SEV_SNP_PAGE_TYPE_ZERO		0x3
> +#define KVM_SEV_SNP_PAGE_TYPE_UNMEASURED	0x4
> +#define KVM_SEV_SNP_PAGE_TYPE_SECRETS		0x5
> +#define KVM_SEV_SNP_PAGE_TYPE_CPUID		0x6
> +
> +struct kvm_sev_snp_launch_update {
> +	__u64 uaddr;
> +	__u32 len;
> +	__u8 imi_page;
> +	__u8 page_type;
> +	__u8 vmpl3_perms;
> +	__u8 vmpl2_perms;
> +	__u8 vmpl1_perms;
> +};
> +
> +#define KVM_SEV_SNP_ID_BLOCK_SIZE	96
> +#define KVM_SEV_SNP_ID_AUTH_SIZE	4096
> +#define KVM_SEV_SNP_FINISH_DATA_SIZE	32
> +
> +struct kvm_sev_snp_launch_finish {
> +	__u64 id_block_uaddr;
> +	__u64 id_auth_uaddr;
> +	__u8 id_block_en;
> +	__u8 auth_key_en;
> +	__u8 host_data[KVM_SEV_SNP_FINISH_DATA_SIZE];
> +};
> +
>  #define KVM_DEV_ASSIGN_ENABLE_IOMMU	(1 << 0)
>  #define KVM_DEV_ASSIGN_PCI_2_3		(1 << 1)
>  #define KVM_DEV_ASSIGN_MASK_INTX	(1 << 2)
> -- 
> 2.17.1


