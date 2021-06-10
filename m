Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A423A2EB1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:54:52 +0200 (CEST)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrM55-0001YZ-FI
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM33-0007Er-KN
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM31-0005uW-W5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623336763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNyku/wUkvlypNPZm/2DPwLGkMFPljQ+Ph7juKv2Vi0=;
 b=JuWg71Qsawow2DyA2TllMfYToTuiuEto3YXKsZesWwd8nqKCanffEo8H7F0oC/NaZkxouL
 rCmHCXku1jBnV6PQLlrRaMShipzYi1ZfnCRrVAEHwuLwHY1ZDJqC55I3XRGY1NWWD3bbcD
 CefP6VYr1iIuk6BETrmtLGBjyc+CuKY=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-8AJbZpFUOFuwp_92r4C0Jg-1; Thu, 10 Jun 2021 10:52:42 -0400
X-MC-Unique: 8AJbZpFUOFuwp_92r4C0Jg-1
Received: by mail-ot1-f72.google.com with SMTP id
 f7-20020a9d5e870000b02902f479dba730so18445169otl.21
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNyku/wUkvlypNPZm/2DPwLGkMFPljQ+Ph7juKv2Vi0=;
 b=ZMEIBfUmRNRUrUruBFTPDnOk8yyOzh6HjoVPZF6jQuxZt6pWfVH9hAprL7vSQ/tGZw
 dg1b0B+8OSG+ZgJQZfO0TqUfoFRlcCf6Z+T/NFhpY4w45Jg9HP59yJ3CdVbmlNcHWa3i
 6Y3ABtmhpt3XYfL3IWiMzgFWzD/tj0NrtWeqxcrdaafShvCveZ8wDN97KY24bGXiItif
 sH1z7NNHxQWWMnwTdofJuWOD1WMFKt82k7BYcXCefZ6BQQMk0tbELSMqeAWGJvSlBSF9
 rLMLNwWWr3PWz9j6NIZsZCU3k2aO5pnBKxIpsaS7QQpM2Ealy2GZtQihW/Unv8K3mAyL
 XcHA==
X-Gm-Message-State: AOAM531dOUmaxV2ZCsY53eOPUVdf6MKUJNZkGnY6FPw4sdx3LOfLBtpG
 y+QOPCR1VvVMRDMB4Bh1AX20y4HE/glw9KvORT5oyy3ON0VrKxj8Ku50+R8FLcuJ4njSsDWlkVc
 lO3PSRsDdtWT7zj4=
X-Received: by 2002:a9d:585:: with SMTP id 5mr2892943otd.12.1623336761712;
 Thu, 10 Jun 2021 07:52:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw1BHbNr1G/O0odHyWIKjEZdm6fPxDBZnRCUeha783476/UqSjYclI1EpI3QVVCXQ8hllTEg==
X-Received: by 2002:a9d:585:: with SMTP id 5mr2892930otd.12.1623336761557;
 Thu, 10 Jun 2021 07:52:41 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 p65sm561600oop.0.2021.06.10.07.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:52:41 -0700 (PDT)
Subject: Re: [PATCH 07/11] target/i386/sev: Mark unreachable code with
 g_assert_not_reached()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-8-philmd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <79212c98-18bc-12fb-4038-cb1a9a70df36@redhat.com>
Date: Thu, 10 Jun 2021 09:52:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 1:45 AM, Philippe Mathieu-Daudé wrote:
> The unique sev_encrypt_flash() invocation (in pc_system_flash_map)
> is protected by the "if (sev_enabled())" check, so is not
> reacheable.
> Replace the abort() call in sev_es_save_reset_vector() by
> g_assert_not_reached() which meaning is clearer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


