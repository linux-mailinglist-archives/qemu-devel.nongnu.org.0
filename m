Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6513F6E8BE7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 09:55:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppP7c-0008Ok-CH; Thu, 20 Apr 2023 03:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1ppP7a-0008O6-5m; Thu, 20 Apr 2023 03:54:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1ppP7V-0004t5-4p; Thu, 20 Apr 2023 03:54:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f189819513so3688515e9.1; 
 Thu, 20 Apr 2023 00:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681977259; x=1684569259;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rlMZGzABfYVwgRPwdO0lLnSJgoIp6XmXJrdTz3/kXaA=;
 b=ECc9asmq2Lz+YurUvhjRkiSwU5CCV5r6VG4FSRg7bkfEYkNji8piCScs8/i3C1Z5Ug
 Eu7Sut11pXOaas2NyhGS+3Xpd1keubuzuajHS3qEwv5k4Ddaz0PqQONRZgK5CodzBu1+
 dzlZQcAx1ldrB9dNXBdBk1//D9hkIIuOvVNOI6I4njYdS9gYrXWUmwMecbCa7z4LOhHe
 TtMRy4PdPFI968J2aEavPPsCIJCLZnGL6KzSyG7RqaVkv0VNMj1xT3xpoYnJBovrmSer
 kE10BeCndvKj5q3/T4ylpDchCZAw41ICzhEguxZy4jbdqDPU3exJNIIZ84DEHlFvT7sY
 RWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681977259; x=1684569259;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlMZGzABfYVwgRPwdO0lLnSJgoIp6XmXJrdTz3/kXaA=;
 b=JpJDq9/n+WQJW9gHI9N9HOGUK0Z/HWLqqiElzoIPf9tWliQSZd5ffwgLKMJUxyTeHL
 hhTlGIXMDCIRNUy/Un0GbPHCWPVkrZS7m9CPLlQP8PNJNlOu8s8dhNL2Ols9FFSyoCZQ
 5hKHN0MWpFngtSBAeSCa8Trx1B8hU1mO1sFXjr4Bg0P3ZB2NjHJAVNO0x31mZSTYq/jc
 nmyOVRX6v38GH+mivfzm6N2EP46jDhkwghOk1RlqfCLnDELeykdO1TiKxHq5O52hEBdI
 /eG6oJpwaYpCMLPXIChuRjH55dSmtP315uWtE7NRjpWVUtrNy3jxq/aZV0tvdw6ZHmE2
 emOw==
X-Gm-Message-State: AAQBX9cjs6oa6foIVlDpwqSip6VCYDGhkWB4cLX6NC5i65Bb+6RA5+os
 W0Ikx6MtA5WQzftzifHcwAU=
X-Google-Smtp-Source: AKy350YwSxaMZK3BIhAnKSE4ARMe4QpMbE9h4JdhWydGxfvL57OHI8B911smipOAj0mZNoxRya3sKg==
X-Received: by 2002:adf:e886:0:b0:2f9:94ae:99f8 with SMTP id
 d6-20020adfe886000000b002f994ae99f8mr617299wrm.14.1681977258895; 
 Thu, 20 Apr 2023 00:54:18 -0700 (PDT)
Received: from [192.168.6.46] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002f53fa16239sm1196264wrx.103.2023.04.20.00.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 00:54:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2e7ce635-a3f6-ebf4-6866-51b78c736265@xen.org>
Date: Thu, 20 Apr 2023 08:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/16] hw/xen: do not use
 aio_set_fd_handler(is_external=true) in xen_xenstore
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, David Woodhouse <dwmw2@infradead.org>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-9-stefanha@redhat.com>
Organization: Xen Project
In-Reply-To: <20230419172817.272758-9-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/04/2023 18:28, Stefan Hajnoczi wrote:
> There is no need to suspend activity between aio_disable_external() and
> aio_enable_external(), which is mainly used for the block layer's drain
> operation.
> 
> This is part of ongoing work to remove the aio_disable_external() API.
> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/i386/kvm/xen_xenstore.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


