Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E74DC4D7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:28:39 +0100 (CET)
Received: from localhost ([::1]:51444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUoJ4-0004au-NA
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:28:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoH7-0003Zk-Gi
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoH5-0000Oh-M6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647516395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nak+DWM3eCpC/wKDntzflu5dcYOzVZkeZluZMPFFxdM=;
 b=gcvOR54gs8Ez6kjLWphGDNX444nHG/lKbEZ+8wuBPirKKhHtpyUyF991veXgxM9PnGCg3d
 vEudF8OInD9JM1TyHQC+fMxfs6qB2pi1M6AOkO+UpK2mT6KOcSm+f6ls464dTIGRt5TkBs
 v6yN2wjO5aIH2QR6XqniMkrN9jPQSLM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ZlQb50DrOy-KjxhTotaRuw-1; Thu, 17 Mar 2022 07:26:34 -0400
X-MC-Unique: ZlQb50DrOy-KjxhTotaRuw-1
Received: by mail-ed1-f69.google.com with SMTP id
 u13-20020a50a40d000000b00419028f7f96so69791edb.21
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nak+DWM3eCpC/wKDntzflu5dcYOzVZkeZluZMPFFxdM=;
 b=dh8SLzbc/nLwn5YuQCkcWQ3Tf1QZsXQ8zqllKxh0050oJ4XQrtdMjz0f6PvYqOVRGU
 sdfmhjQIAt+4bouyK6Ab8Mkc3e3yeD5d6r7Zvh+Z+nYUKqoA+AIqwFkNmrfDoB8RGKGU
 /WhF4CPEJoChCa+rzn0yIKly1mDw6F6qBnYG1VsLPkadghFuqPdWGtg7rYjFWS/82J+o
 P8bcqCSte/BiqNEOaqQt/2DtuN44+T7+lrJxNSEf+BKnrZf+b96BlGqNsEPpLiFn0oWk
 wTZa3MelhtCkpdIu7aKpsQ2bhZZSwPxP5ugXeyzeyb/rPJMYlDoLxcEbJXOVSJVfPcei
 nxwQ==
X-Gm-Message-State: AOAM532gRhzXHDgUrm5dJLaZg9UEPzNJjRcZaAIKD44qwZyf8W7+gaM+
 +9mfTg4esXOdNsxd0Ru2bENwMtMJbPvT1N3OJxxaQVAiAjTuUIaRezQdUgEP/Rgl25IWdggDQl0
 mV4YIr5QBZKMcBsw=
X-Received: by 2002:a05:6402:3592:b0:418:6d45:2008 with SMTP id
 y18-20020a056402359200b004186d452008mr3857458edc.131.1647516392875; 
 Thu, 17 Mar 2022 04:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjK56CFBvDErLIp6yKnqXsFoYYJfEiZBsTbDaKYTQljo6LKbwFHBBo6jpTEznm71+ScqniBQ==
X-Received: by 2002:a05:6402:3592:b0:418:6d45:2008 with SMTP id
 y18-20020a056402359200b004186d452008mr3857433edc.131.1647516392662; 
 Thu, 17 Mar 2022 04:26:32 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 gb29-20020a170907961d00b006dbcd3c3999sm2198486ejc.149.2022.03.17.04.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:26:32 -0700 (PDT)
Message-ID: <7c4ed938-e8b6-797a-64c3-a3df92a2ddf2@redhat.com>
Date: Thu, 17 Mar 2022 12:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/14] iotests: add qemu_img_map() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-6-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:53, John Snow wrote:
> Add a qemu_img_map() function by analogy with qemu_img_measure(),
> qemu_img_check(), and qemu_img_info() that all return JSON information.
>
> Replace calls to qemu_img_pipe('map', '--output=json', ...) with this
> new function, which provides better diagnostic information on failure.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/041                         |  5 ++---
>   tests/qemu-iotests/211                         |  6 +++---
>   tests/qemu-iotests/iotests.py                  |  3 +++
>   tests/qemu-iotests/tests/block-status-cache    | 11 ++++-------
>   tests/qemu-iotests/tests/parallels-read-bitmap |  6 ++----
>   5 files changed, 14 insertions(+), 17 deletions(-)

[...]

> diff --git a/tests/qemu-iotests/211 b/tests/qemu-iotests/211
> index f52cadade1..1a3b4596c8 100755
> --- a/tests/qemu-iotests/211
> +++ b/tests/qemu-iotests/211
> @@ -59,7 +59,7 @@ with iotests.FilePath('t.vdi') as disk_path, \
>       vm.shutdown()
>   
>       iotests.img_info_log(disk_path)
> -    iotests.log(iotests.qemu_img_pipe('map', '--output=json', disk_path))
> +    iotests.log(iotests.qemu_img_map(disk_path))
>   
>       #
>       # Successful image creation (explicit defaults)
> @@ -83,7 +83,7 @@ with iotests.FilePath('t.vdi') as disk_path, \
>       vm.shutdown()
>   
>       iotests.img_info_log(disk_path)
> -    iotests.log(iotests.qemu_img_pipe('map', '--output=json', disk_path))
> +    iotests.log(iotests.qemu_img_map(disk_path))
>   
>       #
>       # Successful image creation (with non-default options)
> @@ -107,7 +107,7 @@ with iotests.FilePath('t.vdi') as disk_path, \
>       vm.shutdown()
>   
>       iotests.img_info_log(disk_path)
> -    iotests.log(iotests.qemu_img_pipe('map', '--output=json', disk_path))
> +    iotests.log(iotests.qemu_img_map(disk_path))
>   
>       #
>       # Invalid BlockdevRef

This breaks 211, because originally, the output wasn’t piped through 
Python’s json module, i.e. the original json data was printed as it’s 
generated by qemu.  Now it’s parsed by the json module, and the Python 
object is logged, so the output changes.

Still sounds good to me, but this part will require fixing up the 
reference output.

Hanna


