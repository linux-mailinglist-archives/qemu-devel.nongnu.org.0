Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B087E4E4E65
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 09:41:35 +0100 (CET)
Received: from localhost ([::1]:43818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWwYg-0002Hn-6l
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 04:41:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWwXH-0001QX-0k
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWwXD-0006kK-72
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 04:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648024802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5d4C6CQYpVgLYmfYzXTqUtCSh0UHpqS3hC9VG4/K8Q=;
 b=OLTEA0RXg4+tEJ4lEg0DGYBh4EHMPGgH9vYrkdGzqiA72A9OqLZXS01rzFlnrMOtigHTYS
 KHlxDYhR4aSD1bFhz1EHQWUVZGwLYQhyzVqFG7D8HOCV3Pu78LPZioQ3xLhuklYkgC9Emn
 71NzSf6kgranVa2zM/bFc8JREp+lwhY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-IT-hDL6sMvayUGIvybS9ag-1; Wed, 23 Mar 2022 04:40:01 -0400
X-MC-Unique: IT-hDL6sMvayUGIvybS9ag-1
Received: by mail-wr1-f72.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so261394wrp.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 01:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M5d4C6CQYpVgLYmfYzXTqUtCSh0UHpqS3hC9VG4/K8Q=;
 b=eclyCObfTcngwsu1Bo4vsGIVjOhLSJ6/vhO1m1Yw1adjXwJOD9/V+tz6qSidpW7qGI
 /7rl+09iB152v3OIxM+h9Mha8BLtllUcSu5z//hb3V4w+jRVFoAfYy+IBpsPbvqF3kWB
 3QA76Gn0Uy3A2nchT7CM5OLsjnUYFd03DrwadszFZaYiItbP7XmPoteW+NRxmQtXvRj4
 f9N10j0+QDxULoKGq3APyXAUI1IQXQbBZlUhw/Kl2UmyOq5mV0/UFSZDVIsuG3R/MxQ6
 SG1DgasIbSHCcYlhb/wOUePgtfpuuX51i78xiGsKsprgzjqgpodEypGnaCbtoQsGSFxk
 7/qw==
X-Gm-Message-State: AOAM533kU1/JGu5RXCHjup/9di+Vx9Oz/gPpCrJWfvH/8jiERYkfwOOa
 xZ3vj2Gejt0GD2CWCd1oLvcbG/EBLfsn2WDFN7nOsIXlezHu/v9733OXR+zSvfqBQaHjNMJQ9tH
 v3CBoomlvAhedrqA=
X-Received: by 2002:a05:6000:1a88:b0:204:1f4f:1c2 with SMTP id
 f8-20020a0560001a8800b002041f4f01c2mr8293814wry.642.1648024799612; 
 Wed, 23 Mar 2022 01:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK9Uh75Liwko+++GHQB8MsrSrZY+rIu0Uhr1w1zZBU1A8HTpwUOtH+l1ZrNcRcb9XaLlHsfg==
X-Received: by 2002:a05:6000:1a88:b0:204:1f4f:1c2 with SMTP id
 f8-20020a0560001a8800b002041f4f01c2mr8293783wry.642.1648024799335; 
 Wed, 23 Mar 2022 01:39:59 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm28213803wrr.54.2022.03.23.01.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 01:39:58 -0700 (PDT)
Message-ID: <51806099-c55d-ce5e-ae3f-e1609c8a92e5@redhat.com>
Date: Wed, 23 Mar 2022 09:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] iotests: update test owner contact information
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220322174212.1169630-1-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220322174212.1169630-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2022 18.42, John Snow wrote:
> Quite a few of these tests have stale contact information. This patch
> updates the stale ones that I happen to be aware of at the moment.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/025 | 2 +-
>   tests/qemu-iotests/027 | 2 +-
>   tests/qemu-iotests/028 | 2 +-
>   tests/qemu-iotests/036 | 2 +-
>   tests/qemu-iotests/039 | 2 +-
>   tests/qemu-iotests/059 | 2 +-
>   tests/qemu-iotests/060 | 2 +-
>   tests/qemu-iotests/061 | 2 +-
>   tests/qemu-iotests/062 | 2 +-
>   tests/qemu-iotests/064 | 2 +-
>   tests/qemu-iotests/066 | 2 +-
>   tests/qemu-iotests/068 | 2 +-
>   tests/qemu-iotests/069 | 2 +-
>   tests/qemu-iotests/070 | 2 +-
>   tests/qemu-iotests/071 | 2 +-
>   tests/qemu-iotests/072 | 2 +-
>   tests/qemu-iotests/074 | 2 +-
>   tests/qemu-iotests/084 | 2 +-
>   tests/qemu-iotests/085 | 2 +-
>   tests/qemu-iotests/089 | 2 +-
>   tests/qemu-iotests/090 | 2 +-
>   tests/qemu-iotests/091 | 2 +-
>   tests/qemu-iotests/094 | 2 +-
>   tests/qemu-iotests/095 | 2 +-
>   tests/qemu-iotests/097 | 2 +-
>   tests/qemu-iotests/098 | 2 +-
>   tests/qemu-iotests/099 | 2 +-
>   tests/qemu-iotests/102 | 2 +-
>   tests/qemu-iotests/103 | 2 +-
>   tests/qemu-iotests/105 | 2 +-
>   tests/qemu-iotests/106 | 2 +-
>   tests/qemu-iotests/107 | 2 +-
>   tests/qemu-iotests/108 | 2 +-
>   tests/qemu-iotests/110 | 2 +-
>   tests/qemu-iotests/111 | 2 +-
>   tests/qemu-iotests/112 | 2 +-
>   tests/qemu-iotests/113 | 2 +-
>   tests/qemu-iotests/115 | 2 +-
>   tests/qemu-iotests/117 | 2 +-
>   tests/qemu-iotests/119 | 2 +-
>   tests/qemu-iotests/120 | 2 +-
>   tests/qemu-iotests/121 | 2 +-
>   tests/qemu-iotests/123 | 2 +-
>   tests/qemu-iotests/125 | 2 +-
>   tests/qemu-iotests/126 | 2 +-
>   tests/qemu-iotests/127 | 2 +-
>   tests/qemu-iotests/135 | 2 +-
>   tests/qemu-iotests/138 | 2 +-
>   tests/qemu-iotests/140 | 2 +-
>   tests/qemu-iotests/141 | 2 +-
>   tests/qemu-iotests/143 | 2 +-
>   tests/qemu-iotests/144 | 2 +-
>   tests/qemu-iotests/146 | 2 +-
>   tests/qemu-iotests/150 | 2 +-
>   tests/qemu-iotests/153 | 2 +-
>   tests/qemu-iotests/156 | 2 +-
>   tests/qemu-iotests/162 | 2 +-
>   tests/qemu-iotests/173 | 2 +-
>   tests/qemu-iotests/176 | 2 +-
>   tests/qemu-iotests/182 | 2 +-
>   tests/qemu-iotests/192 | 2 +-
>   tests/qemu-iotests/200 | 2 +-
>   tests/qemu-iotests/216 | 2 +-
>   tests/qemu-iotests/218 | 2 +-
>   tests/qemu-iotests/224 | 2 +-
>   tests/qemu-iotests/225 | 2 +-
>   tests/qemu-iotests/228 | 2 +-
>   tests/qemu-iotests/229 | 2 +-
>   tests/qemu-iotests/231 | 2 +-
>   tests/qemu-iotests/250 | 2 +-
>   tests/qemu-iotests/251 | 2 +-
>   tests/qemu-iotests/252 | 2 +-
>   tests/qemu-iotests/258 | 2 +-
>   tests/qemu-iotests/259 | 2 +-
>   tests/qemu-iotests/261 | 2 +-
>   tests/qemu-iotests/310 | 2 +-
>   76 files changed, 76 insertions(+), 76 deletions(-)
> 
> diff --git a/tests/qemu-iotests/025 b/tests/qemu-iotests/025
> index 80686a30d5..5771ea9200 100755
> --- a/tests/qemu-iotests/025
> +++ b/tests/qemu-iotests/025
> @@ -20,7 +20,7 @@
>   #
>   
>   # creator
> -owner=stefanha@linux.vnet.ibm.com
> +owner=stefanha@redhat.com

Wow, these were really old ones ... I wonder whether these "owner" lines 
really still make that much sense if they are neglected that much, or 
whether the information should maybe rather be captured in MAINTAINERS instead?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


