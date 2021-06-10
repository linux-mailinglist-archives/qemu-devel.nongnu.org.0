Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C83A2EC9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:57:05 +0200 (CEST)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrM7E-0006EH-Ty
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM2x-0007BY-8w
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM2v-0005sI-Lq
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623336756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Hutmf1papZK8oUI1c3oBsfM68wSk1zfWy8UkAhSOm0=;
 b=U5+Zk6gW+19b3FUwyMG8Lx+RwbSu44P5mCXqMFx6+t+8f54fN2NleWCVOC93pD6gMRYNdl
 xyIviBN3/+tU1EZf5rtjjPkOorg635FINO8E91+kjoqUjf3s62yZj9QMRd8UvQIHCBsAFF
 UZ1owV5FtMW9fpRnXwS81RBq8VsV5cU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-dNSYwPOoNIifxASVRVsT3w-1; Thu, 10 Jun 2021 10:52:35 -0400
X-MC-Unique: dNSYwPOoNIifxASVRVsT3w-1
Received: by mail-ot1-f71.google.com with SMTP id
 e16-20020a0568302010b02903feaaa5cf10so2060188otp.8
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Hutmf1papZK8oUI1c3oBsfM68wSk1zfWy8UkAhSOm0=;
 b=KnMyymmUXzFlxF0JawPimUhh3iFdoP727PPAILIjfkkO1NxXFai+pg4K7he05TvER5
 jsCieefploer40FzCnunJ7Y44HPjB57fm5MngkFlHzJJ4qVX9NExSZ08QTj3fKiQhsqv
 jDcr1clud4dIdzVjuiLwIZGKmhn1uzMbpiGrgmLwMKnTZ8eRU3H4VJenwsRvBaIJm0eK
 eV99jJ22U7NCFrgTGuih1dDknTM5+WopNELVZEEPHdk6a7338UnvQnXruh/PW0Cvhduj
 J4xMYySem6VFWHJ/9q+Bf3mlPG8bb/9YffSlKkpv1TcC0Lw8AzqMH1oFHw+ksmcq5fur
 6yVA==
X-Gm-Message-State: AOAM533tJn/Lcl3gwUmSebr9IRdD8+0UvOPggm+mgzZ/I8X9jzhWfdz4
 aAEv8rzUw3OlnCNEKh22qF7JKLQXDui8qd06wGBaL9uTP69f2P3UGvn1Wtb1Ohu7aRfRvUJsTv7
 Eg6yz9xxDqBleCzQ=
X-Received: by 2002:a05:6830:17c3:: with SMTP id
 p3mr2846424ota.140.1623336754998; 
 Thu, 10 Jun 2021 07:52:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9zHj3kx0TPgoiMaEUQrp36et93DdE65bi29Rqe0IO6DhzUhIt2mXBqGLiIhrzBPQh4GNlrQ==
X-Received: by 2002:a05:6830:17c3:: with SMTP id
 p3mr2846414ota.140.1623336754862; 
 Thu, 10 Jun 2021 07:52:34 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 q1sm555908oos.32.2021.06.10.07.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:52:34 -0700 (PDT)
Subject: Re: [PATCH 05/11] target/i386/sev_i386.h: Remove unused headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-6-philmd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <6037886d-4b8b-9380-c2bb-c283e384c6a6@redhat.com>
Date: Thu, 10 Jun 2021 09:52:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
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
> Declarations don't require these headers, remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


