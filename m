Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43504261A4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 03:22:06 +0200 (CEST)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYeaL-0002go-QK
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 21:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYeZA-0001wY-60
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:20:52 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYeZ8-0003yV-OW
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:20:51 -0400
Received: by mail-pf1-x436.google.com with SMTP id o133so547069pfg.7
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 18:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=YHyAVA1tkLvC54KAK4bvHf1EF4ZQJFDd98l0i2A6s+k=;
 b=Nyux0zd7NLOK2L0IjzYeMZabNP3Iz5ku3u7VbjFdnov7XmBUpye5eYc73we62hPuy0
 EhyKEEznG/yDL9/KoizdN3nEKJugPwwFVdKQCS1zrqP2bv05bE2VIBs2ULs0uIWDx2DX
 Wf0XZLL6XMtHwxjKV+2hQVHqkcsZ6Yyid47vqCqKt0fTlOmkAc3SV0VoeoWztypdI7NC
 nL/Rw9s6piESYgiXb2aKN5tYydmQpk7kFm9en7ZcXBHtNzvvVL4+2WmjFQ1wrvNwtymU
 vVhGzXeaBHY00BLM7ZmfKQ/QPJMPv5+4ZoWIG6wvheZIkYjA2macpRRgDbqKlN3jDQlk
 +6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=YHyAVA1tkLvC54KAK4bvHf1EF4ZQJFDd98l0i2A6s+k=;
 b=TvWvpDFsFLvGzSffdAWWMaz8HQATIR9p7AJ6TOJbtFvaAnkeHnx01NEXzc7tWWD+yb
 64uS3hqvrQP7rWxbm1C76ab6pe7azmdGhUggGDyxHbVT5Jbr9ooeVeHG1petKAwYq2Ac
 MVzXNIQXHUi5NcWjfohEiUBHMroO+AxVZ9j0pbsiXUQeqIhdPAaVFEyy0iKvbIrAVCYO
 ud1f9MJ6pEzJtvO9bO97vbFgynjY5RgNxoJkpuGcrUcfzldLzKMT8nQd0CgMNoB4z6J9
 w7j7BdJAqR87P6wqxIuPmK9OIZyZTcVbNFHxqEVP61cBFliksRG+oNB6IMVBrVDqARVX
 QdlA==
X-Gm-Message-State: AOAM532ZZ5ebSYrxuY0hcjnCWRsvJoLGzv1URUOEn7Lkbaon3LhKlLD6
 d6pLq8SJTmveqpIMXbWGhhmdfw==
X-Google-Smtp-Source: ABdhPJz6Bls6gjPhKHjexNHKM72BZapASUek74O736Dm9oxcj+7WrR9XWC/R1aFk4HsXFI4e2/BXlw==
X-Received: by 2002:a65:44c4:: with SMTP id g4mr2399369pgs.254.1633656049135; 
 Thu, 07 Oct 2021 18:20:49 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.240.146])
 by smtp.googlemail.com with ESMTPSA id i2sm6428764pjg.48.2021.10.07.18.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 18:20:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 8 Oct 2021 06:50:42 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v7 02/10] ACPI ERST: PCI device_id for ERST
In-Reply-To: <1633626876-12115-3-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110080650280.820442@anisinha-lenovo>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
 <1633626876-12115-3-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 7 Oct 2021, Eric DeVolder wrote:

> This change reserves the PCI device_id for the new ACPI ERST
> device.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  include/hw/pci/pci.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d0f4266..58101d8 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -108,6 +108,7 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
>  #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
>  #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
> +#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
>  #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
>
>  #define FMT_PCIBUS                      PRIx64
> --
> 1.8.3.1
>
>

