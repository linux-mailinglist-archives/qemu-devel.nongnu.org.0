Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1628957B4E9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:54:34 +0200 (CEST)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE7Ld-00021K-7F
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE7JJ-0008AM-Jz
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE7JH-0003fP-7f
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658314326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLELaWxkpjE2iJPz622B0Im/bRLdFKaZ57bzWrzOdKE=;
 b=NlRoum8nx5OCL9a9m4Df2gfSq1xFlS3j65kb46QD+OBRNV+gsV9LM93qYwsDwqPGVtrqQx
 n44U6RWmn9WtnC/tTAPPvHg/FP/lvfVJNBvLjb/kJcR3swdE8vEmKxbVasxtGwR6/HlE82
 KYgNNNhy2b9jrznhrszSJ9QMN5cygfs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-9pxp5SahNN-z3FzSw4wAlA-1; Wed, 20 Jul 2022 06:52:05 -0400
X-MC-Unique: 9pxp5SahNN-z3FzSw4wAlA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so8210647wma.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 03:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CLELaWxkpjE2iJPz622B0Im/bRLdFKaZ57bzWrzOdKE=;
 b=XBCNuia4TCGsbaPa4y1tQ2GrJuT9QSZ2MkS5xefxjkiVf3xJp4rvObsQNPRUaHfWCI
 Y/ncNoy5qE5HYYCR5UX5kB80CRl4jZBwnnAJ7p0o3tU7f9udpF/07DDklJobam2fYkld
 YWXT/mBGs8Mz+tDI/WzCafRVAcTzhWthkrr+VdaEHGO50ddz8FtAJ5hwmpuJN20YkR5W
 voDrNXNdq+CNatm1vAHz++IapR31aaRAvbF05zGtBw1nP5nFzA9nIdjyf7Pgx/2RL+PD
 f/6b+06H+6AYqpaWeHBY9Tm9LNM1V7VyV1JHDCI/KGpOHi2v0FP3af2L0PBfkmD+dWe7
 ln0Q==
X-Gm-Message-State: AJIora+RI/nwi+kg2bFzNV1rtFF6pFwdcYJiZhy9ZxYDhAirq0K3cUD1
 D38dyfmx4qMYuYhYXCP7wUgto3zE+nZeoE/7Pf/xxiZIgO5KUOMZcQ0qqm3Il00UJQ5y4cVF8VJ
 641X+XPibaKjHOf0=
X-Received: by 2002:a05:600c:3592:b0:3a0:4c17:5ec1 with SMTP id
 p18-20020a05600c359200b003a04c175ec1mr3406847wmq.4.1658314324201; 
 Wed, 20 Jul 2022 03:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfotd0GQbmQBcHWQ3pKxLTjsIDMacQWpzkbSuQHtBsESE82gT3cbiO+1WQPV3GdLZ/iHyVLg==
X-Received: by 2002:a05:600c:3592:b0:3a0:4c17:5ec1 with SMTP id
 p18-20020a05600c359200b003a04c175ec1mr3406832wmq.4.1658314324012; 
 Wed, 20 Jul 2022 03:52:04 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b003a2fde6ef62sm1555143wmq.7.2022.07.20.03.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 03:52:03 -0700 (PDT)
Message-ID: <718b0346-dd8c-ef5a-4089-b4e2ac7b1302@redhat.com>
Date: Wed, 20 Jul 2022 12:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
 <YtWxHSjpORK31aLs@xz-m1.local>
 <4ebe2d62-b627-3d2b-3c3e-73701fbf7be5@redhat.com>
 <YtaJg0zU8Fo3p2NB@redhat.com> <YtcLucZuvELrFC0f@xz-m1.local>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YtcLucZuvELrFC0f@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 19/07/2022 21.53, Peter Xu wrote:
...
> It seems the button to generate API token just didn't have a respond for me
> until I refresh the page (then I can see some token generated), however I
> still haven't figured out a way to see the initial 6 letters since they'll
> be always masked out..  Changing browser didn't work for me either. :(

I haven't tried in a while, but IIRC the token is indeed only shown at the 
first access - and if that's not happening for you, then there is likely 
something broken. Are you using some plug in like uMatrix or the like? Maybe 
it helps to switch that off?

  Thomas



