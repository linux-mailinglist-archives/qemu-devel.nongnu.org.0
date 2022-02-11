Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546124B220B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:34:33 +0100 (CET)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISK0-0000ey-FT
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nISFx-0005Nk-8H
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:30:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nISFu-0005tD-5p
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644571817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gUml+dxBLecm+sRcUaN2lnV6JDme1HQw9M7wfPZPlA0=;
 b=bjYMu6pXIn0q0n39RYenfE5/4ax53DwSTbZ2Tx0mzwzqZq41GpzZFjZZPnTA3RZaggmO2J
 619XGE5+R5nL/TZPpX5fzBbVdp9v1P8ZuKCMzUql1QS0Zg37/ag3rh4J5CvFYQAiEXQHgY
 05dr8oMAPeIMI7Re1kCNweIq7xVZggk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-DskChZAqMSqM6tahA6vGow-1; Fri, 11 Feb 2022 04:30:16 -0500
X-MC-Unique: DskChZAqMSqM6tahA6vGow-1
Received: by mail-wr1-f69.google.com with SMTP id
 i10-20020adfaaca000000b001e4b2db0303so1683527wrc.23
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 01:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gUml+dxBLecm+sRcUaN2lnV6JDme1HQw9M7wfPZPlA0=;
 b=QDsC1h4COFoIyxI7sFH9WHKrh4YVtueiT85wC98avrkoRk7Rq18YFd0Qb5kaynaR9Y
 Y4LEa9+hz5ddOy5ms0C1rLfe57uKzmH1k627XcOURTBPkyvSx+5iErSLu88bNAUgUfRO
 9MuLe3vnzQzyVNuUUtFYu1ZyheuKeaN+isWLZYj1RgYbsIONxQde7d/PYKXIcEqV7pcy
 BtuARjdX5b1hp5Vo5fC+E8DstNBac9Z0oeI9noHr1uuLiZ2c+jS81jHnraAuN2ETdPVg
 0XJ1R0p+qNZ+SdbqxVi81eOslvJWwyfnXa2LQdfH29ndqnurOfixRDHYM6GtttsEAvma
 KlZw==
X-Gm-Message-State: AOAM532GsI6UyL4hSZTgEDKK6ajoCOS+yzEeQdTa7nEOmSQ8ArjiUclR
 EFqZ5UGBtljA2CPKF1KWhcPwu+DF8FaZc9QPk4MOQgw8gzECTJYzYDLRTWW3f+JL7yKhHpWpwPM
 hxFnq4nuG3cQCMbo=
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr596846wri.621.1644571815001; 
 Fri, 11 Feb 2022 01:30:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl5JGrHXWLaReUzQGGykMFBgkH1Q/n03vhfCBO8KBfA9ONIuUGH5z8Jhg/baNkp56y2pV1nQ==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr596815wri.621.1644571814650; 
 Fri, 11 Feb 2022 01:30:14 -0800 (PST)
Received: from ?IPv6:2a0c:5a80:1204:1500:37e7:8150:d9df:36f?
 ([2a0c:5a80:1204:1500:37e7:8150:d9df:36f])
 by smtp.gmail.com with ESMTPSA id j15sm1012346wmq.2.2022.02.11.01.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 01:30:13 -0800 (PST)
Message-ID: <b3c4a45867c6fc452af41f91f7bda482a882c766.camel@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Date: Fri, 11 Feb 2022 10:30:13 +0100
In-Reply-To: <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain> <Yfu08bAJKnRC3eFD@redhat.com>
 <Yfvkf1cBPGc4TR49@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mtosatti@redhat.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-02-03 at 14:19 +0000, Stefan Hajnoczi wrote:
> Yep, I didn't comment on this because I don't have a good suggestion.
> 
> In terms of semantics I think we should have:
> 
> 1. A global default value that all new AioContext take. The QEMU main
>    loop's qemu_aio_context will use this and all IOThread AioContext
>    will use it (unless they have been overridden).
> 
>    I would define it on --machine because that's the "global" object for
>    a guest, but that's not very satisfying.

So I tried to implement this. One problem arouse:
 - The thread pool properties are now part of the MachineState. So as to
   properly use QOM.
 - Sadly, the main loop is initialized before the machine class options are
   populated. See 'qemu_init_main_loop()' and 'qemu_apply_machine_options()' in
   'softmmu/vl.c'.
 - Short of manually parsing the options, which IMO defeats the purpose of
   using QOM, or changing the initialization order, which I'm sure won't be
   easy, I can't access the properties early enough.

Any ideas?

Thanks!

-- 
Nicolás Sáenz


