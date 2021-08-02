Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C023DDFD8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:07:44 +0200 (CEST)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdHr-00009d-FV
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd9Y-0003nd-Bh
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd9W-0004w1-SL
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627930746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2gzCVrlEOqqqWo38pqSdaYJavw8Zx+cvNX7DfE/C8o=;
 b=RgF9ufoUMjTQB5G6NGi6fmkepS5tllZ2kTYhcAGQ3MGdZWDLEji00G8chbUaBILdgicbaM
 CIAWHfuu3c2pbK9lPiOEi7YW5okDiFTBxp2T+/ENlzl9OzDAqj7EsZs17KVHbsUoc94cov
 n1xTIHV/s2hKQS11n1QPOULMcDvYgec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-v6eEf5QCPseS5a-MxAd61A-1; Mon, 02 Aug 2021 14:59:05 -0400
X-MC-Unique: v6eEf5QCPseS5a-MxAd61A-1
Received: by mail-wr1-f72.google.com with SMTP id
 l14-20020a5d560e0000b029013e2b4ee624so6821050wrv.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z2gzCVrlEOqqqWo38pqSdaYJavw8Zx+cvNX7DfE/C8o=;
 b=iy7njUV+HWVO+WdwCV0adlffuOiWcWL+0s1zIPvw9gkex1ArfPAwUY9ODuV4qbYz/v
 l3bB4M9iAT3uO2yhtxej49CheiYahk5iqfof4T2G19obJTnBsRTl4FB90Pcz0ELCnPUE
 RRaNmJG7Pd6suIEb6YuBz7bi6/WN2aoM4bxZHReXkBX3L9yupzpT5MS4veHE1crZTUUk
 a0q6+leinNtHfC0KVYbbSykD6ae0ou1OXxpXJHW1rjuhwVAAGdWsIAnJP2mHkAOCp7Ui
 8RMQIsdH6CwoXp6VYQpSxrKEmZVXTM8Rzflnf1gNARhwJYT9aStx3nWQ7sQZLGHrhZGK
 gwAw==
X-Gm-Message-State: AOAM533zArbknxHjv05E+ok9BxWkAcHzKEEPJtpnq7nq1vGT9LbXKcA6
 pLMmYdywDT1SnjP+p41Q+3R5+U05xYcQlGmY92cyagJcu061ssUq6RGAGgIi9unVq6mQifgYYNJ
 MHpFI8TF8VKY4mOw=
X-Received: by 2002:a7b:c8c6:: with SMTP id f6mr376591wml.44.1627930743941;
 Mon, 02 Aug 2021 11:59:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLvWnFfEv1gDLh1teQQPAMWn/GeniW2gQKfs2PLDI2+azm5xJUeRhGzWp5ibDkKW7wBRPijA==
X-Received: by 2002:a7b:c8c6:: with SMTP id f6mr376584wml.44.1627930743774;
 Mon, 02 Aug 2021 11:59:03 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f15sm11642980wrp.12.2021.08.02.11.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 11:59:03 -0700 (PDT)
Subject: Re: [PATCH 13/16] vhost: Clean up how VhostOpts method
 vhost_backend_init() fails
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d1a3246a-4be8-900c-b384-259dc6d5bfc8@redhat.com>
Date: Mon, 2 Aug 2021 20:59:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-14-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> vhost_user_backend_init() can fail without setting an error.  Unclean.
> Its caller vhost_dev_init() compensates by substituting a generic
> error then.  Goes back to commit 28770ff935 "vhost: Distinguish errors
> in vhost_backend_init()".
> 
> Clean up by moving the generic error from vhost_dev_init() to all the
> failure paths that neglect to set an error.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/virtio/vhost-user.c | 6 ++++++
>  hw/virtio/vhost.c      | 4 ----
>  2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


