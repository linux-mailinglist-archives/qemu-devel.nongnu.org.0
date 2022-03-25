Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEB4E7508
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:28:33 +0100 (CET)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXkvY-000289-Kr
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:28:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXkt6-0000Hj-90
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXkt4-0007qD-VJ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648218358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJr1on0OiS5aSMRDh0D92ApsYWRlLWIMpjFGJAitBbw=;
 b=TocWwSsFdwaeIzhjUNEfqVoHTQMqR7oxO+GBSz4jrhJ2SOZriAQw1cvdExQ0DPOwkYIvfd
 B7jV2SmN702AIO0ddxUQS0XhYft0Je3d3Zw6Q22fRAFQ4gGtFjm4HbaZpuO5vyqCS2N0a+
 xXx+ETVKOSxp6OGD3o5menQND2QvfA0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-ROo1ywXSOKyki4V37qbxLA-1; Fri, 25 Mar 2022 10:25:55 -0400
X-MC-Unique: ROo1ywXSOKyki4V37qbxLA-1
Received: by mail-wr1-f71.google.com with SMTP id
 l19-20020adf9f13000000b00203f7f64c7bso2739991wrf.18
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 07:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YJr1on0OiS5aSMRDh0D92ApsYWRlLWIMpjFGJAitBbw=;
 b=RTEhy4tTcg5KqrbF78lw/iZT4wSU9nIyxuL6k22Nl+U/jaxjtusHuLAp78ZJ8t1gkh
 6w0AFOe0nVBik45jSDHXYBbdbKnzdm2BhnI0ABI/UkyugR0KzAVgx1ex75tO2TkgYocO
 auPVcpwPDWOArvkNuyDEf4wfFbRTWVK6OD6AI08OljGIQDEs2ZzWKOSi8KTqFTy7HLo/
 q5TMw3aoktJ+LVFIfb1Kb47OQELa7AWCCea+TJix+GOIS0sO3Zyna43cWs/pqFdKViJy
 jjIbWNXVIU9BnLPwzYfpfniBTRSS1YJe9NjlmysEcQXPQixnwgF4gE7ovh03ugqMhhIp
 xhxw==
X-Gm-Message-State: AOAM533ZqW9EHNX2JSFRW+0SFPZd5K4vYvsY5cGFJGOakB3qAXQg77Vq
 teIMCnNWPVJx5pxV17Kg3kBYJ1XOENkMRw6pYu0YG2XEshJZV5b7mFXGSE2eC80uEku9+MSFOqu
 ikIT6e+HTcjuRaz4=
X-Received: by 2002:a5d:4892:0:b0:1ed:beaa:778a with SMTP id
 g18-20020a5d4892000000b001edbeaa778amr9501692wrq.35.1648218353814; 
 Fri, 25 Mar 2022 07:25:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyayC/hp5xTMO+fuSDHo8heJ4tLqHSXWX5zV5M2kiYis3D4ZJdV1xVpX4o4CWLOFTPtgAGMBA==
X-Received: by 2002:a17:907:6e24:b0:6e0:15c:2068 with SMTP id
 sd36-20020a1709076e2400b006e0015c2068mr11550937ejc.175.1648218343046; 
 Fri, 25 Mar 2022 07:25:43 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 nd31-20020a170907629f00b006dff863d41asm2447998ejc.156.2022.03.25.07.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 07:25:42 -0700 (PDT)
Message-ID: <63319a89-c22f-6273-19bf-0d1e21b611fe@redhat.com>
Date: Fri, 25 Mar 2022 15:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 15/17] iotests: remove qemu_io_pipe_and_status()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-16-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220324183018.2476551-16-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.03.22 19:30, John Snow wrote:
> I know we just added it, sorry. This is done in favor of qemu_io() which
> *also* returns the console output and status, but with more robust error
> handling on failure.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


