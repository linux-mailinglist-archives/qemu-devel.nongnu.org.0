Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F90A6C69B3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfL9m-0001Dj-EU; Thu, 23 Mar 2023 09:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfL9k-0001DV-Qa
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:39:04 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfL9j-0002fe-CP
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:39:04 -0400
Received: by mail-ed1-x52a.google.com with SMTP id i5so39779041eda.0
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679578742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Znl7gxAmm3qzgPG+lCtjKalzHFxGJHvDMoZbIm6CC3I=;
 b=ydCcrRoEeZJhaGvFoVBEgfFHARdK7ZjPlsFNBwsKQpNCl+67xSTXMZFCWnadZHM3a6
 eo+Wgz91RIMjbSKwKyr3JbZGTgoBwXamgvwkyilX4VcyJOAr9K/0LiNf8eiwd4+C20Q4
 3lusifDnptzgdpx3FOQM2f+yKNmrbeMq7ZgnqIUvTrOowiv0u/X+2D2CO9lz5wjCKVAi
 lmyjOesvcwqc0798YxvlqkrfHntbGr3sWHvicZefRdhd7p8GkLJQQ8R2/HE1XgBFTfQp
 /uVxKVNea+QDga3+sjt6vgGL3rO/mxDb7tUGBQg3OqAu1zALO49SisBAA2/7YLho8NZD
 uOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679578742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Znl7gxAmm3qzgPG+lCtjKalzHFxGJHvDMoZbIm6CC3I=;
 b=5QexwigP3gRx0gAMjcGs3nrORh6a632HPIRy+5oUmm6vA9T165OqIjYkXk0hyc/obr
 rckvVHSOyxZR091qZ3aKBq9cNdKdQeSilRIY5STa6WCN/XPsH8BwdzlIgTFdQIzHC7Gz
 WlNbu4MxK9dXdEdqT3CRRDxn5jB2P2XecyWLYBh2omiBnoq42RENA+tun2bvhfCQjo0e
 LHY4w3FlHT0EvOzev9tu0ez0sOqKoasuyKHjDDJI8oi8i0PazlcB8zykw0SJj1LbtQAM
 9hw39K9UFk1u0+lPUxNjXGeTtyWmuZI7Uur2K0iEuP645JUEplMVMIEyq0SlPtcUBJMO
 00YA==
X-Gm-Message-State: AO0yUKUX9qROsbt0GLdUI8wkYqDYch3rC/V2YA8pmspRyLaccBcbQp08
 3AU74+lmP1JGC9oHp/jnzX/N29IbHum1Kg252bEBwA==
X-Google-Smtp-Source: AK7set8zP6yJACeV4rxz6bK+Gu3hQVgjVCmpYp2AkHisvNZyobcHy4cLtwjBvxvgApF7crVQR0FKOGP6No7HsrHy+zc=
X-Received: by 2002:a50:9b4a:0:b0:4fc:fc86:5f76 with SMTP id
 a10-20020a509b4a000000b004fcfc865f76mr5576287edj.6.1679578741713; Thu, 23 Mar
 2023 06:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <87jzz82d6o.fsf@pond.sub.org>
 <0f671d7f-5862-cf59-2ef2-be347c044a0b@ventanamicro.com>
 <87355vy4sq.fsf@pond.sub.org>
In-Reply-To: <87355vy4sq.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 13:38:50 +0000
Message-ID: <CAFEAcA8Yy2-z-J7yjjUxv4ZTg06fEsUt3HVkwNJWYiMBsqkWcA@mail.gmail.com>
Subject: Re: QMP command dumpdtb crash bug
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Mar 2023 at 13:29, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter, Daniel offers two ways to fix this bug (see below).  Got a
> preference?

Not freeing seems the correct thing. As Daniel says, this
should have been a prerequisite for implementing the
command in the first place (you need to change the lifecycle
of the fdt blob from "delete when done with in the arm boot code"
to "delete on machine finalize"). It looks like somehow we added
the command but missed out on getting all of the prerequisite
patches in. (File under "need to be cautious about applying partial
patchsets", I guess.)

Did anything else from that initial patchset get omitted?

thanks
-- PMM

