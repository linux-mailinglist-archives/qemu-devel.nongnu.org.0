Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BAD4964C6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:06:51 +0100 (CET)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyJG-0006Kx-O3
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:06:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAyCB-0003J5-RY
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAyCA-0003U9-Ds
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642787969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5TERP8NkJnM5xsOS8rXlAZFDDcNQHTyAXiALNbZOs3g=;
 b=GudZoa3DkQe3abnI4ZqdDKHUcQ6ODqrX+8vrp1gxQ0fyy0Wu0Ye4ufl8+fGvnlfoWBgOR7
 1slrj6ScjKyK/DIGBRO19iK5j7f4O8b0zRyMahO+h2yiXOAXizh7BTn0ZV8FznLm6/QwQH
 gpXvJwHUHCgOivzfcB48nGI6C9gdYyY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-G0YC39mdMwmSuWCn115Ohg-1; Fri, 21 Jan 2022 12:59:26 -0500
X-MC-Unique: G0YC39mdMwmSuWCn115Ohg-1
Received: by mail-ua1-f71.google.com with SMTP id
 x9-20020ab05789000000b002fa60bdf012so6062916uaa.1
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 09:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TERP8NkJnM5xsOS8rXlAZFDDcNQHTyAXiALNbZOs3g=;
 b=ApRDgiZ30S6imj9W3jWL7KErWK2X+WnNlbnPWcYoZ3XRu/rtMaUG7m9hyyYUnqeyK/
 mSXx3jl80BCzdBHcOtHNx3VnBa5Z8ch37Ph37hkneZeGYcS0CDtU5lubRL+Qz+S4BlOz
 xrgkL25NFg5jj5rDaNqEUX+JlwIEKEdxM4jz4EPwlWJmUd+xeJ+n6+C8KmMg1zLU2zLf
 MxSY8aovES674jCGur6MLdMj6cEW9UKWrvC0maTg2ijqJv+bbe1s4mhudaCU/5DOsU7/
 RWWaORIP8b9zl6IPx5a9b1sAts47fDqYUf7tA074pjrpwWDMbEl57L53NuMVr2RpbqfE
 8PKg==
X-Gm-Message-State: AOAM531yJbwuQFVONRszxB1kphwiVE35SL4jhJTB+g8yE8lk1iypUM8E
 IisApBK6nZixsAohM0lul6/DzmHU0ivn1Cvnb41jrvv2AndMCzUTdtkiEpl9oH5yw670gazEwWV
 LWnHNzeb2SllHWAIACyFXo6nBRimkb8o=
X-Received: by 2002:ab0:2614:: with SMTP id c20mr2389480uao.50.1642787966039; 
 Fri, 21 Jan 2022 09:59:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCl8jALBWmKBGLRzBmsjvDIpjER0mYy7RaGoOEbwIfTeUZvxJgkQYs4QcrYZKAnt8hAdd4UdBAFA3V8GL973Y=
X-Received: by 2002:ab0:2614:: with SMTP id c20mr2389473uao.50.1642787965868; 
 Fri, 21 Jan 2022 09:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-4-vsementsov@virtuozzo.com>
In-Reply-To: <20220121162234.2707906-4-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 12:59:15 -0500
Message-ID: <CAFn=p-auRxO01jpVgG-2hqi+cNQhv1qjk1bd+OQS9GNWk4WFsA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] meson: generate trace events for qmp commands
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 11:23 AM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> 1. Add --no-trace-events to suppress trace events generation in some
>    cases, and make trace events be generated by default.
> 2. Add corresponding .trace-events files as outputs in qapi_files
>    custom target
> 3. Define global qapi_trace_events list of .trace-events file targets,
>    to fill in trace/qapi.build and to use in trace/meson.build
> 4. In trace/meson.build use the new array as an additional source of
>    .trace_events files to be processed
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

patch 2 and 3 come out clean under the kinda-sorta-linting I've been doing:

Acked-by: John Snow <jsnow@redhat.com>

(No time to do a bigger review, I'm drowning in backlog ... you and
Markus know where to find me if you need something urgently, though.)


