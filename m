Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56234107F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:48:50 +0100 (CET)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1Ri-000319-0k
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lN1PC-0002KR-GS; Thu, 18 Mar 2021 18:46:14 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lN1PA-0006oG-UE; Thu, 18 Mar 2021 18:46:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id d191so4462731wmd.2;
 Thu, 18 Mar 2021 15:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EwAaR1vG1xN+ihd/4iiRHQB+7VXRaOERrZW334LjMsg=;
 b=SnoiWNpqUG6dZsqu2fYsFmeHZOUnvd+IO83XHEc1asTMVjva9H/Z27eU/yXg80SGz+
 VBUmP01EL7ZAWdj1KIUTLvuBj0VLAADHA3QpEuoVfWRtfwnhOPVr5eXciFtJO48kz12A
 vBKbre4sl+57+EwfUCeU3eP8LX/mCBQuYny3J6rDK01TrD7w1R4EaiDymijAWPrcSSzG
 knIfEJLYhvD+BoxDdKL9bkO6h24a4lBGS79xTRPzNF/3swr0ixTtMOgJAnaa860LNytj
 5PvzhnAG9KGY7SYN8le5MJpsA84AIVCCG+wnZ1Dtxve3/SKQqcinz7XjS8b+5H9kOAF0
 Zc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EwAaR1vG1xN+ihd/4iiRHQB+7VXRaOERrZW334LjMsg=;
 b=FcCLsLMcQbQDTZnSnyOxk5vbEC5MiyqKgoGInlp+J3O0TqTEIK94+Ofa+tnlZGdsKT
 9KeSFhOZKRoDHopAdXZqQ7v7vKrQnBk7M+q/PAkq/s6qencrtoA7fY+tUspWLIFaVcWi
 8tNeQdBdolDM4KGLkdIyxZh+2BD3KSOotxBGyZIzJZst9ZwrDIjCQb9Qn0ASF05lJ4Xy
 vzIImT2NAQOKs7l4MnxEm+8HyzThs9Dj3K366gN4SSDEM6NG/YRUEZ6lw5jUfedTGzEL
 A/UaM+EvoKFHMjRUfa0y0mcm/XwSoaDBNrrnuA4BTOjTf8Wx+2IhdE23Lvw9kdY7NDGD
 j4pA==
X-Gm-Message-State: AOAM530/IoXagVuKLesYCGYLLkTF7pUdve0XY0UL+YVmCff/0oIANshL
 9KViOyhNc9P5sVlpHBAZ9g7OhYdEr1+dEA==
X-Google-Smtp-Source: ABdhPJxnZx/tFEP0v5NfJRFAJI0S8ncRP1IYNFRbYrSc4VACip48aBySRnOX7nOGkGKMxEqRGLVTMw==
X-Received: by 2002:a1c:e482:: with SMTP id b124mr1093334wmh.70.1616107569137; 
 Thu, 18 Mar 2021 15:46:09 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m11sm4507512wrz.40.2021.03.18.15.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 15:46:08 -0700 (PDT)
Subject: Re: [PATCH 3/4] iotests: test m68k with the virt machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-4-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1bd3f7a2-e159-d3e2-fd70-749cc5ffde69@amsat.org>
Date: Thu, 18 Mar 2021 23:46:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318223907.1344870-4-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:39 PM, Laurent Vivier wrote:
> This allows to cover the virtio tests with a 32bit big-endian
> virtio-mmio machine.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  tests/qemu-iotests/testenv.py | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


