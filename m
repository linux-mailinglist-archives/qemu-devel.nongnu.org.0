Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E350B780
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:39:54 +0200 (CEST)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsZl-0004FW-GZ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhrp7-0005x9-Vq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhrp6-0004nf-BA
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650628299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gStBLNBImLTEiBXKhqi9MZjiDvJgjHRDCRfvWqwxk+Y=;
 b=SbsU2CjLqnQvEHsdIMl2qVbskr2Bq/Pbwu/aDaq+lznJjFSiUOogKYCKuZLiwTIewUp8/e
 SLt/gavAAkAw9IzpLyHhMPoMVkbKROVs9AWqiMlBqAmrJ/P2cHHQfIkK/SDom+fUsd6Qvk
 l/SzcjKlB4IQoC5M8z+GDPTg1jUyKb8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-Ila6ATikNwObRMQygVTr9w-1; Fri, 22 Apr 2022 07:51:38 -0400
X-MC-Unique: Ila6ATikNwObRMQygVTr9w-1
Received: by mail-wr1-f70.google.com with SMTP id
 j30-20020adfb31e000000b0020a9043abd7so1833032wrd.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gStBLNBImLTEiBXKhqi9MZjiDvJgjHRDCRfvWqwxk+Y=;
 b=kIIx0knHvGHnrVhQwgGtaCKZ3kzXxhNwm4n5sIBJFq7aYVjPRNBOOpGe0ZoRBGcjF7
 KQqKi9cnOTbg58yC9c1t1MuflGPQDUFJP7LIbaqB67jG1otKfW4hFJsoK9fM+yzVT8+4
 n/d8I8GAl8/m2deNJujj77NxYV0DIDyZJdejyYi5Usc+f4w96Yvi2Etrh9i4lNsoCiZ4
 ZvS7bsLtbARRuxN6nNeYzfY9a3LY+XDCVrEgbXEqNvHH2ILgivtL26lvi2mLtRADNEgm
 fl6U1shmrYw+Tj/8bQZ2LmEG7GLvUnNPRRupDGJz05FryhUMCggzyDDgdEDlPep6ATBX
 gTDA==
X-Gm-Message-State: AOAM530yibI7YAKSkuQ1hBR1uZtOCKJiixa/9WfxelvbzkLN/sxfISUT
 jisYo0QxXGzZEhbc4lJSBQZdDlDwNUaoMIDRg0/wi5c6JUeORmCnfMtMXD3+Iw5jxg46W3dOQs+
 aX/pn9QcFRCpmj8A=
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr13018072wmc.146.1650628297264; 
 Fri, 22 Apr 2022 04:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGjAb5b0m9iEQNF55C/s1QCfagiSXDtG2SzUGD9Lujd/jlJ97nfu46Z0GYxbY7RFSQMlQ/cA==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr13018040wmc.146.1650628296984; 
 Fri, 22 Apr 2022 04:51:36 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92?
 ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 h19-20020adfaa93000000b0020ac7c3b530sm1691881wrc.74.2022.04.22.04.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:51:36 -0700 (PDT)
Message-ID: <5b30180257e769d17ae429b6b5bc0d65a78c30f3.camel@redhat.com>
Subject: Re: [PATCH v4 3/3] util/event-loop-base: Introduce options to set
 the thread pool size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Fri, 22 Apr 2022 13:51:34 +0200
In-Reply-To: <87ilr1z7vg.fsf@pond.sub.org>
References: <20220401093523.873508-1-nsaenzju@redhat.com>
 <20220401093523.873508-4-nsaenzju@redhat.com> <87ilr1z7vg.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-04-22 at 13:15 +0200, Markus Armbruster wrote:
> Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:
> 
> > The thread pool regulates itself: when idle, it kills threads until
> > empty, when in demand, it creates new threads until full. This behaviour
> > doesn't play well with latency sensitive workloads where the price of
> > creating a new thread is too high. For example, when paired with qemu's
> > '-mlock', or using safety features like SafeStack, creating a new thread
> > has been measured take multiple milliseconds.
> > 
> > In order to mitigate this let's introduce a new 'EventLoopBase'
> > property to set the thread pool size. The threads will be created during
> > the pool's initialization or upon updating the property's value, remain
> > available during its lifetime regardless of demand, and destroyed upon
> > freeing it. A properly characterized workload will then be able to
> > configure the pool to avoid any latency spikes.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> [...]
> 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index e5f31c4469..06b8c3d10b 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -506,9 +506,17 @@
> >  #
> >  # @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> >  #                 0 means that the engine will use its default.
> > +#
> > +# @thread-pool-min: minimum number of threads readily available in the thread
> > +#                   pool (default:0, since 7.1)
> 
> What do you mean by "readily available in the thread pool"?

How about "minimum number of threads reserved in the thread pool"?

> > +#
> > +# @thread-pool-max: maximum number of threads the thread pool can contain
> > +#                   (default:64, since 7.1)
> >  ##
> 
> If you add "Since: 7.1" in the previous patch, then the "since 7.1" here
> need to go.

Noted.

-- 
Nicolás Sáenz


