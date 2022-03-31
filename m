Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625054EE0D5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:44:11 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzmC-0004fU-Qe
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:44:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzc7-00087f-Ch
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzc6-0005Bi-11
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648751620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yge8uA8i/K/Xpv5IP7ZSe5rfYc/UXX93z9Nj9ggi4ug=;
 b=ZjIgDcuteepKi1QS1RIG4Jr8LVH4wHqaLvTQHTDGfgWkdIws5gfroRfie5FF0cN8ivFvnx
 10WZibIu6n8qXFxKFOmUEn3Rjk6RQg0sN6eH5j0que7PAvUuD8B1AC9dqGoBx7kpA6buLl
 00bq+OtzV96CjEVfSljZ2VfCc3MK6gY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-JzN9YRflM02IJUAr084G4Q-1; Thu, 31 Mar 2022 14:33:32 -0400
X-MC-Unique: JzN9YRflM02IJUAr084G4Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 f7-20020a05622a1a0700b002e06d6279d5so211145qtb.7
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 11:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yge8uA8i/K/Xpv5IP7ZSe5rfYc/UXX93z9Nj9ggi4ug=;
 b=FFGjkux5i2AbW2/ROJd+FqUmy8cXpeCvDparj5ZY0eARpUOAIbxAAVIb452d/4S0Dr
 AZkFnlKY93RU8zYOovzDG0wIm53YkPNEmTuh7UpncbKCP8d24dk5aiUkrws/VVrxgM3B
 nxgsQRE68zdcaDqp07A9Fr0vTtW3hpg+qqH2Lpk5hPbuMJwy21uLuZhHxBKzXGIDp84X
 x0DndcIo2b/wAR7fYehIAwsHvZwUY8mwIclMFMzMAqMI6Nyspa/D9S6i2N5CSyQny9Pt
 qDoaXIZXK+o/pbP4yNMWc0en5muC8tLLfsda3v9OcLLSsnb08XNDc9mdHMZrbzpO7Zwx
 KN0Q==
X-Gm-Message-State: AOAM532Rodph116tZtqnMkDgdX7FNuKw4HbF0qEzjoOG2TfA4f3knRm1
 O2PoJrP4EVzsbyPw66dKMf2cqBEOPW9zr6ewFLx/3/VQxO+3jrZixx7kexHpBkBidiGA+m5a/sn
 yxq6VqOPmLF64W2Q=
X-Received: by 2002:a05:622a:1b91:b0:2e2:1ed2:311e with SMTP id
 bp17-20020a05622a1b9100b002e21ed2311emr5551507qtb.192.1648751611803; 
 Thu, 31 Mar 2022 11:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq+Y3INl3iaHWncdQ3OW7W9WqivzeoUCYcchmCkWUxf6OWJxRlVJv3BVJktt69d6hFvWnl+g==
X-Received: by 2002:a05:622a:1b91:b0:2e2:1ed2:311e with SMTP id
 bp17-20020a05622a1b9100b002e21ed2311emr5551486qtb.192.1648751611557; 
 Thu, 31 Mar 2022 11:33:31 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a05622a134800b002eb8401862bsm83093qtk.34.2022.03.31.11.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 11:33:31 -0700 (PDT)
Date: Thu, 31 Mar 2022 14:33:29 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v22 8/8] tests: Add dirty page rate limit test
Message-ID: <YkXz+fi0c9UIN2Nn@xz-m1.local>
References: <cover.1648748793.git.huangy81@chinatelecom.cn>
 <a6f7b4d02677622cd5e20c2437faf92ae7fab59b.1648748793.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <a6f7b4d02677622cd5e20c2437faf92ae7fab59b.1648748793.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 01, 2022 at 01:49:24AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Add dirty page rate limit test if kernel support dirty ring,
> create a standalone file to implement the test case.
> 
> The following qmp commands are covered by this test case:
> "calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
> "cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


