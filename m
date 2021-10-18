Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5B43132E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:19:55 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOoE-0006EU-NW
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcOn3-000445-Di
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcOn1-00062B-FK
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634548717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+/3gXAWvXJ0d+yi3wzD1wIycsi42V5bHclAwurQEoM=;
 b=PjfDKWkEGtA5+4nBM40ulQRIBA1WPC1+B/2uCDaN5aFaA3VaK4oiCDSHRU4k1nua6wh868
 sC18WIhfte5R1SlwnPKEtGA3qDgpLDRAcoXP2vJ6PdcWTmAaW+sBBEnejkigljj0PsBDPh
 /1f9GzL4iVkEW+UkTWPJwPc1oY/cjug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-SQssU1i4M6yqJx_Af8coHw-1; Mon, 18 Oct 2021 05:18:34 -0400
X-MC-Unique: SQssU1i4M6yqJx_Af8coHw-1
Received: by mail-wr1-f69.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so8635501wri.11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/+/3gXAWvXJ0d+yi3wzD1wIycsi42V5bHclAwurQEoM=;
 b=REKylnQ0jef27Ckz0DYc5h7J97vGQlfmyMlpUYUoFr4kLslXms6i1hn5QTb6KqXqvL
 KvDWYyHROrV4GFjYSSyCnqJzMLw+vQQ72u/jwOD+k00CALGe+53CBTI3hX6ktwkleIlu
 I8+XymrEK5g9Ie+6ztUyQ7/uVb4AcnZw8BFc/LZDbyLXsnOJ0OLWq5PhJmKT93/ILsNJ
 mPT+K8gVGpYiQh5MGFwkhHuzTqbJB7sd/zfMC5YHfUDQOl37HSozHLuGxfBD5CNHccfg
 UMJgRhwiIRbG+uUNzK38kXAOaCIgnfnYT44DBONt4W6sVhzKUw0BqHxNZl2HBto+mtjP
 phmA==
X-Gm-Message-State: AOAM533dZ81fdFf58zds1DJg9Dl5NOsXY20dLTA98Lclx6rOFquRdSF9
 NLZEuoVgwDroiinZX3Zqxsyei/JzXimtNnNA5JxYTK+lIbTy7kj9Mg4pHw5ixEnMdvgqgzqMboQ
 2Dum/POSZMGB7SL4=
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr33877203wrd.24.1634548713476; 
 Mon, 18 Oct 2021 02:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuBTYU65is1ebDTuBolUZ00ua5C/ijrxdDw+TQb2xmNzgpfl1fW1YC4iszl/Ksp4VgXdsv9g==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr33877185wrd.24.1634548713293; 
 Mon, 18 Oct 2021 02:18:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z135sm7167598wmc.45.2021.10.18.02.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:18:32 -0700 (PDT)
Message-ID: <9f8f9578-1d50-e584-b401-fc7773ac1f30@redhat.com>
Date: Mon, 18 Oct 2021 11:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] accel/tcg: Register a force_rcu notifier
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20211015161218.1231920-1-groug@kaod.org>
 <20211015161218.1231920-3-groug@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211015161218.1231920-3-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/21 18:12, Greg Kurz wrote:
> +void tcg_cpus_force_rcu(Notifier *notify, void *data)
> +{
> +    CPUState *cpu = container_of(notify, CPUState, force_rcu);
> +

Perhaps add a comment: /* Called with rcu_registry_lock held, using 
async_run_on_cpu ensudes that there are no deadlocks.  */

Paolo

> +    async_run_on_cpu(cpu, do_nothing, RUN_ON_CPU_NULL);
> +}
> +


