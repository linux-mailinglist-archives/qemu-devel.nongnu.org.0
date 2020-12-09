Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B582D4D19
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 22:47:24 +0100 (CET)
Received: from localhost ([::1]:33610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn7Ix-0000th-Qm
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 16:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn7Fx-0007j4-5y
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kn7Fv-0003lz-6n
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607550254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJjFIeLVof+JxjOuQw/guQoR7S9jQk8Z3R/I5mbTZP4=;
 b=aARs8nFFcgs4tklZ8NMVwvpuPGcg8soGKH6vwFZ7zxR+RJg1Um23d5KIjXHVkw9XtdW/aK
 gzELQBzcFS2FFZFrfpcmGTk43y7hlmIvyS3Z2/L1+Mqy1VxIfpHqf12WC7YeTDwYUXk26L
 u5qxf9dHH/lnDQbexVGh8cE+5BMS+WQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-nHmDOoQXNLa448HFY7kYVg-1; Wed, 09 Dec 2020 16:44:12 -0500
X-MC-Unique: nHmDOoQXNLa448HFY7kYVg-1
Received: by mail-ed1-f69.google.com with SMTP id g8so1490992edm.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 13:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pJjFIeLVof+JxjOuQw/guQoR7S9jQk8Z3R/I5mbTZP4=;
 b=dX82XN3slaub0mDdmYN8gco/ZagsS2d2BKAVByRC+gBWnfEvY7pupsPwns6lyaRniZ
 tbFhd3Y6ipEy7uI+8aGgIRCQhFH6ppwkTlDKKs8H/tcbGB5/2vo7n4HQRDsNNAFaOmJj
 3NC3b1Il6NlAdtnJHnFQUkG3oQ0v3p5PLdXxzAFyDKfVHli+98aXFi9K+gLgkOQMdXRA
 45ANuJCeOdDQhzW7ZaCaJl4zwNPLUTXCmHVr1NKMq6tLhToEE66VAHDrWpR2yrpFoFTk
 9owgRjGkjPd2uInJP12QoCv2ugq/mKRPWL6177ZoQIrjTptr5hTqXiSzUY728xKAz1LU
 L2nQ==
X-Gm-Message-State: AOAM533YKCcq3s6tkj2ciWx+MWWF8Gzih8el+QQ39OO6j47IhcGfW0UD
 xMqbzWFad9zoBw4WtKB1LgGR0qXTh5dTcOMoHLSZiVTBjNdlydFvvuvlTTOPCFxrB7VW5nfZ/We
 0KYQoknPThfPltJY=
X-Received: by 2002:aa7:da01:: with SMTP id r1mr3981986eds.45.1607550251659;
 Wed, 09 Dec 2020 13:44:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSsjhYBSajNz0ZsTKMmdWbQes3I/P5O0oM7ES5Yoz8fJq/0X6LUtTKYDXKRXXnoxzZn0M/0A==
X-Received: by 2002:aa7:da01:: with SMTP id r1mr3981973eds.45.1607550251460;
 Wed, 09 Dec 2020 13:44:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id j7sm2966282edp.52.2020.12.09.13.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 13:44:10 -0800 (PST)
Subject: Re: [PATCH v2 1/4] vl: Add an -action option to respond to guest
 events
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, qemu-devel@nongnu.org
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607536336-24701-2-git-send-email-alejandro.j.jimenez@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d6a63dd6-a10f-c352-f1ca-f79cd1db4070@redhat.com>
Date: Wed, 9 Dec 2020 22:44:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607536336-24701-2-git-send-email-alejandro.j.jimenez@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: david.edmondson@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/20 18:52, Alejandro Jimenez wrote:
> -static int no_reboot;
> +int no_reboot;
>   int no_shutdown = 0;

Since you are at it, please move these globals to the new file.

Paolo


