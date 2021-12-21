Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EBC47C767
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:20:06 +0100 (CET)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzkg9-0005Uz-0b
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mzkcf-000453-5n
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mzkcc-0001hY-6u
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640114184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWJw3elYEeFOITcalhxcoLWN9Ip2mloubtTnS8qC2t8=;
 b=jBJjy3e3yrBhImUPC4/83B8G+/I7S1YAUJzXwXsrj2Mi2f3P7HLTpJGfYRgfMmWtKtXHqr
 3q40uaPFnMk2JwT4igV+bp+DUdJ+jd9lTCBtgDVPeFzxG1olu0Ib/DJKnZBwqqyleE/bqJ
 3Tzq9fF55K8CemRCOP02nGgGDZsatkQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-dA1dkwnnNA-trTAM4fMxrA-1; Tue, 21 Dec 2021 14:16:18 -0500
X-MC-Unique: dA1dkwnnNA-trTAM4fMxrA-1
Received: by mail-oi1-f198.google.com with SMTP id
 n141-20020acad693000000b002c6b2dd398eso96153oig.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 11:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWJw3elYEeFOITcalhxcoLWN9Ip2mloubtTnS8qC2t8=;
 b=68rJcrTIMbB34rWc+5FiRPO75yO5rl6Hgz1iDNpVNZzw2I3hNiY/u3iDB5qOhLCzrs
 +Z+LoQxEzvc+YzF/hpG6tGzLzN7WCE7R5ZX1qlANwRQgAq6AWLtNr5tuN+T5G34LUQ12
 duqb6VkLwodxBbj90ssJjNRsQ6TDCxsSE3yq6Pk6o4e3YZHilzS0oaAe2BCZXAG7rOz/
 jOrCZ11Ezf1zOOGW2zL0uNYlW3ydSbR/JPu+Fa411FkSynsiWRHQCDNMmPTIzpc2f6bK
 8CFU42QieRcjF9oaCqS/9kG9CSsDvxKNJCOJoYMN5YDychn5CMJmhmFPczAFDnVsq3UE
 AyTw==
X-Gm-Message-State: AOAM531AzqOyMFcyliWKTIlqIsDkwKiH0XkeSgJCsgnrIkedhBcdSUpF
 D1WYIqLYMFZg4UhSk3LMuACz+81bIyjBnkKzazl9LcWTI29qvyS+cF5UkkUYjC+Q7JaveIfAa8i
 QndUr0/qVPq/7P2A=
X-Received: by 2002:a05:6830:1e97:: with SMTP id
 n23mr3188312otr.4.1640114177262; 
 Tue, 21 Dec 2021 11:16:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEB/Hp5oOTDE5MLYqR5AyhGPm5aLLvHy3Pl64bjkQEqD1A/uVm9UiviEIsR4xQAmIzk49R9g==
X-Received: by 2002:a05:6830:1e97:: with SMTP id
 n23mr3188302otr.4.1640114177014; 
 Tue, 21 Dec 2021 11:16:17 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id a6sm4271849oic.39.2021.12.21.11.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:16:16 -0800 (PST)
Date: Tue, 21 Dec 2021 12:16:15 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH] vfio/pci: Don't setup VFIO MSI-X for Kunlun VF
Message-ID: <20211221121615.67166113.alex.williamson@redhat.com>
In-Reply-To: <20211214054534.6633-1-cai.huoqing@linux.dev>
References: <20211214054534.6633-1-cai.huoqing@linux.dev>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 13:45:34 +0800
Cai Huoqing <cai.huoqing@linux.dev> wrote:

> No support MSI-X in BAIDU KUNLUN Virtual Function devices,
> so add a quirk to avoid setuping VFIO MSI-X
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
>  hw/vfio/pci.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7b45353ce2..15f76bbe56 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1994,6 +1994,13 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>          ret = vfio_setup_pcie_cap(vdev, pos, size, errp);
>          break;
>      case PCI_CAP_ID_MSIX:
> +        /*
> +         * BAIDU KUNLUN Virtual Function devices for KUNLUN AI processor
> +         * don't support MSI-X, so don't setup VFIO MSI-X here.
> +         */
> +        if (vdev->vendor_id == PCI_VENDOR_ID_BAIDU &&
> +            vdev->device_id == PCI_DEVICE_ID_KUNLUN_VF)
> +            break;
>          ret = vfio_msix_setup(vdev, pos, errp);
>          break;
>      case PCI_CAP_ID_PM:


So the VF exposes an MSI-X capability but it's entirely unsupported
and/or bogus?  If it's not bogus, why can't we support it?  How does
the host kernel driver know to avoid MSI-X?  Should we use the same
mechanism used by the host driver to quirk whether vfio-pci exposes the
MSI-X capability to userspace at all?  Thanks,

Alex


