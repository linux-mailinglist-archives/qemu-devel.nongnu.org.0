Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F104D1B18BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 23:45:09 +0200 (CEST)
Received: from localhost ([::1]:42902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQeE1-0007nb-0r
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 17:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jQeDC-0007Od-Go
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 17:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jQeDC-0000L5-3Q
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 17:44:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39261
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jQeDB-0000K4-NQ
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 17:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587419056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ur0LRAuxFc8ulkjog3Q2fNWV1PxOzVt4euylp8ZQYZc=;
 b=ck05UatTOnI72kqmySPa2OmQjUeu67MDnMLXbJs/55aTFwfs/d5VwiBAlERmKXAVKneees
 35oFDqX3cvge7ROPmXxaH9Qs0KRctpTmDVzyeCs4pJ2QioJ63OWHViQDco3MXzYTpFMdwQ
 4f63vwDUutaOWMKiW08XmtCVTzr+B6E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-aK5xk8tEMP6Z1DZINUe-0w-1; Mon, 20 Apr 2020 17:44:14 -0400
X-MC-Unique: aK5xk8tEMP6Z1DZINUe-0w-1
Received: by mail-wr1-f69.google.com with SMTP id y10so1300391wrn.5
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 14:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ur0LRAuxFc8ulkjog3Q2fNWV1PxOzVt4euylp8ZQYZc=;
 b=WOVfLZdSJlIergN3DJ2hxqgifVq6GpvBGxQsyKftd6GrZOj0hBD14+H7Yn4uEevq4Z
 7l3dEbvZ/QOmNWxhbjsen0b7ORcUuwtOZf4zqGN9g5DPrK1MrelqhQYiWQ50RB9m/JMa
 9QopItOvtzwJl3aqhPxhErE/XbsDfWMrT5zLHmub7+8RXC0L8C63E9rbgtcMnjT5xh4+
 kMuQqpLxlwDjLaoLNa5+uSrG68qerw2u9YindeQuEQjsGksCWcrpZLzBr+iII7cAeVJT
 jHuFdiISnzfEArmPmvMm7PODXvIpDEbSNilIIeciFreP0ha81iuYj2IQpBaDPjAAH3mg
 Lyhg==
X-Gm-Message-State: AGi0Pub2M9jMwQ7fmlFis/iPFO6pGhLazl273fWTFcwQyJlHgIuCMIJk
 fmcn+lWBUC6bDc+22VBxS71DhYqkzJDSxV20kX99rVM4e78/V88XHkBW+sBwHsW1EktreQNpcvI
 6VOb7llCcQy6CBhQ=
X-Received: by 2002:a5d:6607:: with SMTP id n7mr22214758wru.150.1587419053336; 
 Mon, 20 Apr 2020 14:44:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypLNXTIpjLTeHIKxCQLIk/ESjsWkGUdDZmBxuKMCpLoxw+y4BHYykyalNPxezsRFxMHqaTq7sA==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr22214744wru.150.1587419053093; 
 Mon, 20 Apr 2020 14:44:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5c18:5523:c13e:fa9f?
 ([2001:b07:6468:f312:5c18:5523:c13e:fa9f])
 by smtp.gmail.com with ESMTPSA id r2sm945287wmg.2.2020.04.20.14.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 14:44:12 -0700 (PDT)
Subject: Re: Question on memory commit during MR finalize()
To: Peter Xu <peterx@redhat.com>
References: <20200420210049.GA420399@xz-x1>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
Date: Mon, 20 Apr 2020 23:44:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420210049.GA420399@xz-x1>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/20 17:00:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Markus Armbruster <armbru@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/20 23:00, Peter Xu wrote:
> 
> I'm still uncertain how the dirty ring branch can easily trigger this, however
> the backtrace looks really odd to me in that we're going to do memory commit
> and even sending KVM ioctls during finalize(), especially in the RCU thread...
> I never expected that.

Short answer: it is really hard to not trigger finalize() from an RCU
callback, and it's the reason why the RCU thread takes the big QEMU lock.

However, instead of memory_region_transaction_commit,
memory_region_finalize probably should do something like

    --memory_region_transaction_depth;
    assert (memory_region_transaction_depth ||
	    (!memory_region_update_pending &&
             !ioeventfd_update_pending));

Paolo


