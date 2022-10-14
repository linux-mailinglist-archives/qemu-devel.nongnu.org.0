Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1385FF258
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 18:39:14 +0200 (CEST)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojNiL-0000up-DH
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 12:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojNdL-0006IL-Ed
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojNd8-0007MM-Nn
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665765229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ueC5VTlD9srXw3nIH9njJ76Dcn6bg+Ch492X/b41lbA=;
 b=HVOCYLIaBcy+74wO3ce4+jG9L1hYUbyGyl4FhIM/RTkvbewSdGubPIDUUmdDmBIPZK5CRp
 QsC0Xt3Q5td99X6+2R2/FmLHNhnElqmyN5sOcpfHsf6jbYHz3N1Du26odTw9FqgBMhIvLt
 mbLiNlarxJ7h8n8Rk0RlGk9lT/910pg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-RW_cDU1ePs6WiOUnFV4P9w-1; Fri, 14 Oct 2022 12:33:45 -0400
X-MC-Unique: RW_cDU1ePs6WiOUnFV4P9w-1
Received: by mail-qk1-f199.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso3886931qkp.20
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 09:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ueC5VTlD9srXw3nIH9njJ76Dcn6bg+Ch492X/b41lbA=;
 b=BD4LFjKyMejiAVqC0qEMS7V5nzMGu6i7CNSfUObm205kzkqOJSoAMG2Omp7ldXOZfS
 KaI7YmNO0WC9m6iETTNwCCCTZ5588M9io8ZPTf8xdZqtGF/pI0Hqrz7TBhSb33XFHuUU
 wxnzLXkA08hCdAJGlLMoZfDroMtb/6Mi9jINw/PG7lunvkoqKhYOgy/yF5BMXQaQ5hqF
 qnlFdWIxDu2M1R0Cgn4k2JRCc56jH9R41Ydu7K7T+ERhWWG8DgWRL9L4llUQV9VQVMti
 /U/9dIJCIy07m5QoYU7zL8iUiW8IeoDO/2K9as8Irv5m46AyMMhGPa1fUH8eWF7M+hto
 O1sA==
X-Gm-Message-State: ACrzQf0ApWZ0itGArUdtjxIj3eg1OvSF4vztkgc0V4cgeOQ3tbHQzkjH
 U5CEMlZGay9Tq5kE27RZPhJuFY/WCk+C4GFce2PZVHUiH6Armq+twP+cZqRxbGdNcOeF6veW9rI
 fxxvSIduarvLKhzQsr7UNHtWDtA2MQzXkQdn8V+pGiRcGHiK/aqMJohpNE85jw0Ym
X-Received: by 2002:a05:6214:21a9:b0:4b3:d03a:95c9 with SMTP id
 t9-20020a05621421a900b004b3d03a95c9mr4756386qvc.96.1665765224109; 
 Fri, 14 Oct 2022 09:33:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM74MRWMKKO0Iw16Yx+dtCd/VkXlyAco+J8lqY7ProCv5xckYK2pWgLX/e16c8iBybDQIbhjtA==
X-Received: by 2002:a05:6214:21a9:b0:4b3:d03a:95c9 with SMTP id
 t9-20020a05621421a900b004b3d03a95c9mr4756361qvc.96.1665765223821; 
 Fri, 14 Oct 2022 09:33:43 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b006cbc00db595sm2780726qki.23.2022.10.14.09.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 09:33:43 -0700 (PDT)
Date: Fri, 14 Oct 2022 12:33:42 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiaohui Li <xiaohli@redhat.com>
Subject: Re: [PATCH] kvm: dirty-ring: Fix race with vcpu creation
Message-ID: <Y0mPZonzmmW4iAIX@x1n>
References: <20220927154653.77296-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220927154653.77296-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PYZOR_CHECK=1.392, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Ping?


