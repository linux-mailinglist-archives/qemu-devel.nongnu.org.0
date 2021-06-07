Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8439E126
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:47:31 +0200 (CEST)
Received: from localhost ([::1]:47536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHTO-0002hS-JG
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqHSX-000235-Fi
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqHSS-0000xG-Ez
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623080791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PcN7ve0JO/uOOXHaMNQs5sFNsATid+8mry0d/zZdW3Y=;
 b=fKy3lE/oxJtR7LI6FbgsWdS0Q67rv4XDb8h+/+GPgn/aUfV+R4EZft8CzW1jMeUFh6CpEV
 DGWZGoDyqOZyG6QJ44BdQoofz4kkeNHrFvn4TXluuM9x7PQrIqKjyBvHN6F0PfzhDe4XnR
 FHmDb76xm0XxuBsXLUcpNqTZ8eQ6sKQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-gxE9Zp-BOdSYlKpNeUgYtw-1; Mon, 07 Jun 2021 11:46:29 -0400
X-MC-Unique: gxE9Zp-BOdSYlKpNeUgYtw-1
Received: by mail-qk1-f199.google.com with SMTP id
 o5-20020a05620a22c5b02903aa5498b6f8so7120441qki.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 08:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PcN7ve0JO/uOOXHaMNQs5sFNsATid+8mry0d/zZdW3Y=;
 b=HkQho+smGsubAKZfmUH1G5YDfZeyhlFHIEdwG0N48fr1lMBpTDLMTKPcoshBoDFdMI
 2nEO8g0Zu705gcAPBr6xw2T0EMdsoFjScOyRgLEJNUV8gZZbTOukXpLXiGdMLXrTwlUD
 YQjvwLGjuWNO3vOll1RItpisthIaVPiiY+/6eooiy+mfI5kovtyRUhndW3tIA6rayAqk
 bVhzWunTrxfToIG6Rpq4xGWNPwIb4jYJ7V6ilvlePM2Eyb33BKh3CmUYL9/dKuxURCS0
 azA2z1PERNPI+5eSIraOZzikaklYQaneVWTvqxqp1Jtey7p42WEH82vOUwCTof+YFyY1
 zPLg==
X-Gm-Message-State: AOAM532QGP6pGn95eODKn7VBjTb0lQ1Ei04KC29eWFzxMfCyjVPceppt
 zLN/c4iecxFHTXe1r2n5mBOQdpwvujoPfUdVLhQCFhK9ClpTufWtwZ5uBw4Xi4DDRl1+AHwqge0
 wIF+TAdAWdmo3BrQ=
X-Received: by 2002:a05:620a:12f2:: with SMTP id
 f18mr17372490qkl.122.1623080789521; 
 Mon, 07 Jun 2021 08:46:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2k1UW6cNUE7+vqoXPJoVhmOJ+22fNTxqeQF9vNJMft6Piy6MiG5SDlqQX5cXFf0xoIJXFVw==
X-Received: by 2002:a05:620a:12f2:: with SMTP id
 f18mr17372466qkl.122.1623080789232; 
 Mon, 07 Jun 2021 08:46:29 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id 7sm9505704qtu.38.2021.06.07.08.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:46:28 -0700 (PDT)
Date: Mon, 7 Jun 2021 11:46:27 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 4/7] migration/dirtyrate: add per-vcpu option for
 calc-dirty-rate
Message-ID: <YL4/U2Kjojyr2wcT@t490s>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <19ad91782f5798844c42e34683fda833f9d1928a.1623027729.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <19ad91782f5798844c42e34683fda833f9d1928a.1623027729.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 09:12:36AM +0800, huangy81@chinatelecom.cn wrote:
> @@ -1751,7 +1770,9 @@
>             'status': 'DirtyRateStatus',
>             'start-time': 'int64',
>             'calc-time': 'int64',
> -           'sample-pages': 'uint64'} }
> +           '*sample-pages': 'uint64',
> +           'per-vcpu': 'bool',
> +           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }

Ideally we shouldn't touch existing exported fields?  I know it's not a problem
since it's just introduced and together with the series..  The other
alternative is to keep it as is but just ignore it in the result (or set it to
zero for per-vcpu sampling)?  No strong opinion.

>  
>  ##
>  # @calc-dirty-rate:
> @@ -1760,6 +1781,10 @@
>  #
>  # @calc-time: time in units of second for sample dirty pages
>  #
> +# @per-vcpu: calculate vcpu dirty rate if true, the default value is
> +#            false, note that the per-vcpu and sample-pages are mutually
> +#            exclusive (since 6.1)
> +#
>  # @sample-pages: page count per GB for sample dirty pages
>  #                the default value is 512 (since 6.1)
>  #
> @@ -1769,7 +1794,7 @@
>  #   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-pages': 512} }
>  #
>  ##
> -{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-pages': 'int'} }
> +{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', 'per-vcpu': 'bool', '*sample-pages': 'int'} }

I still think exporting this new feature should happen as/in the last patch.

Also, wondering whether the name "per-vcpu" would let people think of "samping
pages per-vcpu only", not showing that it's a completely new mechanism inside.
How about make it a new parameter "*mode" (and I think even with per-vcpu it
should be optional as "*per-vcpu") default to "page-sampling" and add a new
"dirty-ring"?

Actually I'm also wondering whether dirty log could be anything useful here in
the future as a 3rd mode (then the "*mode" idea should be more useful if so),
basically for old kernels where dirty ring is not there, we can timely call
memory_global_dirty_log_sync() and calculate dirty pages there just like what
we do with dirty rings (without calling migration_bitmap_sync(), so we don't
need to deliver dirty bits from kvmslots to ramblocks, just pick them up from
kvm and do the accounting for pure dirty rate measurement).  That's a wild idea
though, so just raise it up.  Would that be anything useful?

-- 
Peter Xu


