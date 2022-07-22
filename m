Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9657E75D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:26:47 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyIQ-0000HZ-Hm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExyV-0007hh-My
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExyU-0005O4-2K
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658516769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpFAdwGsXZE/J0EePG1F9dnQMC88yow3XHGLkHjbqAk=;
 b=CqipgxtvSOQSzkhCVZUwV3ehnQpGhFhRWf0kOrvKYYl/npW0UIjMKvdOREs9/n49Nt++Wu
 OFvEgn2qSUNblDb624xv6AJqM8l74k2Prr24Q0bs9PBIq0SlL9t7UnnhB+xTO0KJMragcL
 Ls0OrmFep4BfQzSGJ1aWXROf3tFjOCM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-bLHGhexPNUqXPMVGyOjSqg-1; Fri, 22 Jul 2022 15:06:08 -0400
X-MC-Unique: bLHGhexPNUqXPMVGyOjSqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 e5-20020adfa445000000b0021e45ff3413so945546wra.14
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 12:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MpFAdwGsXZE/J0EePG1F9dnQMC88yow3XHGLkHjbqAk=;
 b=buFyQOHbkO7ivmHxVLwMWooJf7r19be10MW03cbndW+9MsdzVyVeHXhF1p0wYtPHqg
 YE90WjVKjC7ieUpGECHo/b1+aPg//j0WPxaSO4IlRxikYSv3OrfSWp4r9GC2V6yA06lC
 7GXziRH+7N06RNN0v7UZ95+6iehkTcHliXWfW5w3Oya+P5pZBQok5nJcPjOZoOjdkCYq
 MDCuf7E7ryIri9X9XbDq2gQtNyrBiRhNP1PIHz99MOM6YsxVXSXbVA+a94FbhlZwi6ey
 LC/LpyxjhDi81+WJh0YjTVgDV4OdTU1NBc0u8VqPBJU+rfAqlQopRG9dp62S4qNotXp1
 bwQA==
X-Gm-Message-State: AJIora/w+vQsy6VqhPTpNTAPzZwyWcCcI7BI4V4emoyuL4hoXzJyt+f/
 YtrwX16h891igI3dOrkr2Pk723yrHsAu2/9rW8KIGzoPXVn95urTh70vIZx0KQssloaeAourPQe
 mJt2yhlfFU4mf6y6oVSNqvbZAQL2EhHFUcMCsnMyzRwiA4UIw2fiOx4AnnjTo3/fdOA==
X-Received: by 2002:a05:600c:19cc:b0:3a3:3cfe:d548 with SMTP id
 u12-20020a05600c19cc00b003a33cfed548mr811018wmq.6.1658516766905; 
 Fri, 22 Jul 2022 12:06:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgY0gcXTpmZhJIvQ3zUmIgcziADPdtoJ9ba8YfuUNRgjjf9+k1uHV4J/ABV3b79TfAG76ejw==
X-Received: by 2002:a05:600c:19cc:b0:3a3:3cfe:d548 with SMTP id
 u12-20020a05600c19cc00b003a33cfed548mr810990wmq.6.1658516766450; 
 Fri, 22 Jul 2022 12:06:06 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0039747cf8354sm6307408wmq.39.2022.07.22.12.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 12:06:05 -0700 (PDT)
Message-ID: <a1200633-9b76-5af2-837c-235069e2ab49@redhat.com>
Date: Fri, 22 Jul 2022 21:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 00/14] qapi: net: add unix socket type support to
 netdev backend
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20220722185701.300449-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220722185701.300449-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2022 20:56, Laurent Vivier wrote:
...

Please ignore this series, bad numbering and patch 11 breaks SMTP server...

Sent v7 with another SMTP server.

Thanks,
LAurent


