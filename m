Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88925F1A0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 04:18:00 +0200 (CEST)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kF6jH-0000hv-Nw
	for lists+qemu-devel@lfdr.de; Sun, 06 Sep 2020 22:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kF6ia-0000Cn-9s
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 22:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kF6iW-0001Ih-N1
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 22:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599445031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v52hrfRV0UgaOioMWhOr4zFi1IMf+e9nU6DkOS6Vx90=;
 b=D438CavHcLNKr2cThABrUMguueVTHvwiviWyOUbSaXtYqWhhHzg37EJzBVrLibwSVFJJfy
 G6f2ixYYsZjsrGQBY+DlkFztoCRqETVP5tqo6UPl12ulaKFokq4V1KzXdT2sn4trc6FEbD
 CQ7AOIkEo67gHRVcS2n2HSPDxEQHChM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-jPanOcNrNgumYKZ4juIE3w-1; Sun, 06 Sep 2020 22:17:10 -0400
X-MC-Unique: jPanOcNrNgumYKZ4juIE3w-1
Received: by mail-wr1-f71.google.com with SMTP id l15so5145305wro.10
 for <qemu-devel@nongnu.org>; Sun, 06 Sep 2020 19:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=v52hrfRV0UgaOioMWhOr4zFi1IMf+e9nU6DkOS6Vx90=;
 b=RX4tkipCTNpwHya3++eh1Pmm5Mznbkt+jcXy0YjJ/nDWt85TUls7t0kUJNOEfhlMXa
 JrkjgPQ6u8ylEkPVsLLtRTFjJGG5+/3J7iFa8WafGEvHa1OSidZSyWpQZToYuodLMKI8
 Nm2Ig6j5fByeWREGTxXS2oHscaSwqSaDvEQiFN4XuWGdq/CgFZfMQPyGM7Nsfn/VJUFl
 MQeWkTe8p7jaohe2L+zo9NaHaEPmzi1yMas2d3RhsDY64fNrOecyXzzifqRNTqF+758V
 XJZj9OR5fFtmTdF34Hta/BSbIZUm/CKZIjrEjaVy78Dh0hC3mK4l7VeZ9AT0FcdR+aex
 ehKQ==
X-Gm-Message-State: AOAM531AqlH5oi+Pg6ef84SrjEvPtxQtwJ7GhITE1XErO3tq6Uqi5ekq
 J0bm7KCgTszqaAK3TeuK+thVNcfkZgcYF9pXygAJ/HcPsEM/W+T/+rw2Xp4hmECNzB5ESeCbhTy
 4WEIr8kXGXnjIe7Q=
X-Received: by 2002:a5d:6784:: with SMTP id v4mr13671833wru.215.1599445029201; 
 Sun, 06 Sep 2020 19:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzu04iJwbInflVBC8ROcYjO3TKusw+tlYeWIxNC5yE3C8z1FY9IXCMETS843ygg6ph4YrHmA==
X-Received: by 2002:a5d:6784:: with SMTP id v4mr13671807wru.215.1599445028874; 
 Sun, 06 Sep 2020 19:17:08 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t188sm26557437wmf.41.2020.09.06.19.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Sep 2020 19:17:07 -0700 (PDT)
Subject: Re: [PATCH 09/17] hw/block/nvme: default request status to success
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20200904141956.576630-1-its@irrelevant.dk>
 <20200904141956.576630-10-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <d71fbfc3-2621-4aaf-124f-13a88d15a58e@redhat.com>
Date: Mon, 7 Sep 2020 04:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904141956.576630-10-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:17:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.69, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/20 4:19 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Make the default request status NVME_SUCCESS so only error status codes
> has to be set.

Typo 'has' -> 'have'.

> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/block/nvme.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 3e32f39c7c1d..64c8f232e3ea 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -231,6 +231,7 @@ static void nvme_req_clear(NvmeRequest *req)
>  {
>      req->ns = NULL;
>      memset(&req->cqe, 0x0, sizeof(req->cqe));
> +    req->status = NVME_SUCCESS;
>  }
>  
>  static void nvme_req_exit(NvmeRequest *req)
> @@ -547,8 +548,6 @@ static void nvme_process_aers(void *opaque)
>          result->log_page = event->result.log_page;
>          g_free(event);
>  
> -        req->status = NVME_SUCCESS;
> -
>          trace_pci_nvme_aer_post_cqe(result->event_type, result->event_info,
>                                      result->log_page);
>  
> @@ -713,7 +712,6 @@ static void nvme_aio_cb(void *opaque, int ret)
>  
>      if (!ret) {
>          block_acct_done(stats, acct);
> -        req->status = NVME_SUCCESS;
>      } else {
>          uint16_t status;
>  
> 


