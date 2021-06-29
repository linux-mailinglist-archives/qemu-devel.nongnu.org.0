Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F111C3B790D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:03:49 +0200 (CEST)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJxU-00081M-Uu
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIyk-0007Cn-V5
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 15:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIyg-0004Qg-0d
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 15:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624993255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JuukmWECbHg/k4SPuX1R7gdN0/qEoer6rw4AXF1HBy8=;
 b=C6GEe2++ILKYF+AWbKHheF29BMm0q7pZNdXp5zxG8uqfHwDaGER6j2hnJuyg1Rlg5wc8XP
 OHynuq5uIv2n3qsQFAYk8sIEC2pG13e7D5BMyMl7erKeY1tggsDNQAYMcJ/N2GreThHpt+
 wBGQcIxQNO2JCzS4IB49Y20GLTZjKKw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-Puo-PVQsMhC5GL7Fu08thw-1; Tue, 29 Jun 2021 15:00:54 -0400
X-MC-Unique: Puo-PVQsMhC5GL7Fu08thw-1
Received: by mail-qt1-f198.google.com with SMTP id
 y14-20020ac85f4e0000b0290250b0317184so6849870qta.21
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 12:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JuukmWECbHg/k4SPuX1R7gdN0/qEoer6rw4AXF1HBy8=;
 b=i1E2uPDrlRmGgCg29td2xdvywe034X3RyhnVdQlqghyU+Qg0eKqKOw+CBae9brp9MZ
 GQOkTE0uEmSoriCbYu22KLXnadEktUTiohOjKzExCicEcx3XHn58uNvxuNesZZdRSL0i
 8dTdnIbgGLVUAZm9chphoIxzX812v3YCpvK+crdmanB2gWi1dB4kGt+zn6wB04fGhWgT
 fA7syekMk7/fBVoQYLbMQAB5yPw1BqfUgdNLcqGzPcV7Nz3tCkaFh0Xleq5rT21I49Od
 msRK9LlNiguN2Igz76RfaQccqFUTeZvFpvoD8l3quLhMSZlSj0ZJCCIz0Bv2Im0lfC9U
 SvKQ==
X-Gm-Message-State: AOAM530wQTEqWmrmSrDr+Fe7GOFnxgWJA2gHbKyl68/qXN1YDZyIk9Dt
 hQJkVeFWPyL1yMvci2djsfpuObMQg92OsQAejhV2/dyWzn3NUxCplYLNJVZ6073lTlZHXT9FyE/
 pMbCUP6bSgerPF/ppn0HVweOIIjE7Ys/b3eCgx6+uJ8+PhW6+OPY78a/TKrkc5Bq1
X-Received: by 2002:a05:6214:13ac:: with SMTP id
 h12mr12338439qvz.48.1624993253236; 
 Tue, 29 Jun 2021 12:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww1FDcRFlq0QaU3FU/mYlIiLueAaR76eHxkAC/DJMubyB1/Ie3N2+aoU+Mfpf9HVWYxNMy7g==
X-Received: by 2002:a05:6214:13ac:: with SMTP id
 h12mr12338407qvz.48.1624993252946; 
 Tue, 29 Jun 2021 12:00:52 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d16sm9567204qtj.69.2021.06.29.12.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 12:00:52 -0700 (PDT)
Date: Tue, 29 Jun 2021 15:00:51 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] migration: Two fixes around yank and postcopy recovery
Message-ID: <YNtt43C0ncIRnOy2@t490s>
References: <20210629181356.217312-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629181356.217312-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 02:13:54PM -0400, Peter Xu wrote:
> Note that the multifd zstd test may fail if run migration-test with sudo on
> master (which seems to be a known issue now), and it'll still fail after these
> two patches applied, however all running tests keep usual.

There's an unexpected accident; please ignore this paragraph as zstd test
actually passes with/without the patchset applied.

-- 
Peter Xu


