Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93F6F13DC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:07:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psK3s-0000ra-HF; Fri, 28 Apr 2023 05:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psK3r-0000rS-2q
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psK3p-0001Hz-Bs
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682672795;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xfnmCz41CsP9wwgojLzUJlrqqOKiJnYsK/K/mE1wt9s=;
 b=P52WKGGbQlC/b2MOfhqk41kOOfkgCj0ct5YYwo3hFPfmg2JCQHpqOKMZgWzKvYQEy+po1A
 S7Xgv0LKwwhAgfkBsLVMWRLfnVQgqIeagYr3mpv5Jsi63cBhg4ddFCFUpN14+8CvwJCana
 RL1CEFZ5q+GTrH/oAOdBRwRU4S9ulMM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-YeG8-ogiO7WWbwLKKK1ifQ-1; Fri, 28 Apr 2023 05:06:33 -0400
X-MC-Unique: YeG8-ogiO7WWbwLKKK1ifQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f831f6e175so5416460f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 02:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682672792; x=1685264792;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfnmCz41CsP9wwgojLzUJlrqqOKiJnYsK/K/mE1wt9s=;
 b=DRxfWz+1nnCSc0y0O65ICS0JM0Hi9PZeG4Awb6bDNgCOIptQ+XV6Mh/XhifkDR4Fz0
 LeDSBXm1PAj69lJjZbWR+ZgfVbc8mWI1d2oRA8MeNRI25lTf7SttDVt0uppAPONq7EWI
 Z8vDWNcMmSu6NJaT9PvSERP9a/U9SkruUi8X/5uX/wqmV+rnlFCVeLy8BvPGyaMVrWKx
 HBL8EWk99FpyfBJESaaJqtheZUrkCt+YvOAVcs9vFyb3pvE6BaIVS8Rpq5kcQdAIevjf
 McBcsfRnXB4oj0cI1VpjBCvjfzahd1JugNqHQ3lusR3JpTcuWF1yMV6l5QYiJHmOHQwG
 fp+Q==
X-Gm-Message-State: AC+VfDxJN5oaWxbUwWqN549ugOWZ1Fh1BQ2lafFmB1V9WUSP/c+e9G6N
 uF6mqNa8dRBszvlZLzVPLaMvIEXRuRmjDF50bqsD+13tSSLa+OGkR495WjmCiY2NdLSoVv6GmnW
 lBhfIBNVnPn8/RAS9b4aZ5h1WDfo4nux0S94FpqqmiHG9wDeNVMuVnpPXWCY+TK7A04EOTna/7M
 XPw/mI
X-Received: by 2002:adf:ea03:0:b0:2f2:cfc8:ab7c with SMTP id
 q3-20020adfea03000000b002f2cfc8ab7cmr3289089wrm.1.1682672792487; 
 Fri, 28 Apr 2023 02:06:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jw4U4rHUucSpKWWnASRKPORXmUHArEijp9QolejSAFVChiYYk84uVGAcA/mSmSCMFlAFrRg==
X-Received: by 2002:adf:ea03:0:b0:2f2:cfc8:ab7c with SMTP id
 q3-20020adfea03000000b002f2cfc8ab7cmr3289061wrm.1.1682672792114; 
 Fri, 28 Apr 2023 02:06:32 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 h15-20020a5d688f000000b003046c216c18sm15170477wru.30.2023.04.28.02.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 02:06:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH 07/19] migration/rdma: Unflod ram_control_before_iterate()
In-Reply-To: <20230427163449.27473-8-quintela@redhat.com> (Juan Quintela's
 message of "Thu, 27 Apr 2023 18:34:37 +0200")
References: <20230427163449.27473-1-quintela@redhat.com>
 <20230427163449.27473-8-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 11:06:30 +0200
Message-ID: <87o7n89y09.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> wrote:
> Once there:
> - Remove unused data parameter
> - unfold it in its callers.
> - change all callers to call qemu_rdma_registration_start()
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

self-Nack from here.

I just break the case when there is CONFIG_RDMA but it is not being
used.

Later, Juan.


