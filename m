Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B1B4561F0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 19:05:59 +0100 (CET)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnlnJ-0004Gi-VZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 13:05:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mnlkt-0002qP-Ee
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mnlkq-0004Ay-Up
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637258603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7FAfiX4/Aj67W8uHne5P+NHYz/Cmuf3bGaEtRTLNygI=;
 b=dPgPTWIUzhm3BcZLdOF3y4K9JixVki4O/bM8VsmyqMoV0dkJ/jqImx4q1wcDbnNJAlpt0R
 KbF8AwfJrwtzqDOXCuHcejcU82MVSKpeVKK44uf85csMyflmlEzlNs3iP3Udzvs8n3ty2o
 NKQNnHYeuId2qpKWoKXrW5ZI2UClmu4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-svNo5OQxP-yBWnbZJ5vn2Q-1; Thu, 18 Nov 2021 13:03:20 -0500
X-MC-Unique: svNo5OQxP-yBWnbZJ5vn2Q-1
Received: by mail-pf1-f199.google.com with SMTP id
 m16-20020a628c10000000b004a282d715b2so4108203pfd.11
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 10:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FAfiX4/Aj67W8uHne5P+NHYz/Cmuf3bGaEtRTLNygI=;
 b=TuHqNGDmnm3MrmOjZN8w5g2L7XA2Jpf+HBkJ1LT9QGLCb2HB5MrNU/GT5fd3GqHKpV
 qV7oPNNcqSfIhtbpx77QTJILn1sQ5cwVHurjjrZu9zJRq3J842w1K6sgLUL7iTxtKgS6
 lQbXi3bI0avtyM0dhf4CPBGflpESM2SYORR995pRY7uzEExdqiWZO/wTdNnb8Z3OVWom
 xbTFth1Gyu+0yNGiUNsy+BNwxomcIoa8Df4GrzF6SDr08c7LQaiOdgZc7uLGaefQpUjM
 khupGT0AHTAoisLEOf1P8d3sUYIfGfhe7IBjPZYXxPXeGnmvpLS+KbiEn7KXKbc2jZyL
 rfdw==
X-Gm-Message-State: AOAM532tm2UhK4PlN9UJPPb7gXUf3ic9+YiL2RHfM66rNkVqA3HTrhiL
 In6SSm/zFUDcFhLgzRmYS56dQIClw4vZM9hnqo6MQ3GUomH6yr/eDkJI3b4KB8uwODu43cvhz6p
 wIl0VbOVjNMqeYtjAoiuWS4+HZJ5k8DA=
X-Received: by 2002:a17:902:c3cc:b0:141:be17:405e with SMTP id
 j12-20020a170902c3cc00b00141be17405emr69313585plj.76.1637258599703; 
 Thu, 18 Nov 2021 10:03:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMoR/9NzEBL5i+mbg0YMcyFJ5KwhBWsT/TdwVbnpj6UxU3Z4qNOH6+1z9fggeQktP/8paXCcDat4ZVzHNgIPM=
X-Received: by 2002:a17:902:c3cc:b0:141:be17:405e with SMTP id
 j12-20020a170902c3cc00b00141be17405emr69313538plj.76.1637258599409; Thu, 18
 Nov 2021 10:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20211118074702.216951-1-pbonzini@redhat.com>
In-Reply-To: <20211118074702.216951-1-pbonzini@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 18 Nov 2021 15:02:53 -0300
Message-ID: <CAKJDGDbG5-w20XP6fqc2g6O29HEKLgAeTmO1sDonGOcZMu3Hcg@mail.gmail.com>
Subject: Re: [qemu-web PATCH] remove deployment phase from CI
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 4:50 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> qemu.org is now served via a reverse proxy from qemu-project.gitlab.io; it does
> not need anymore the rsync step to the QEMU project's shell server.
> Remove it from the CI.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.yml | 24 ------------------------
>  1 file changed, 24 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


