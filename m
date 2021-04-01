Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9A351555
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:44:45 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxcq-0004BW-3M
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRxbn-0003iJ-JE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:43:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRxbl-0004hW-3f
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:43:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z2so1887010wrl.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+Q01I0tnLZ2pvPB6K7ZGqD6ZeWDlCyee/2e2OJTawFQ=;
 b=Tj4b/V3bfHjElV11/Sd5Zh1Qb+RGNqin2Fe+cXWLhRMUBRk3Qw7OTmj1s5tHulCM5L
 02D5ZbHitHaau3cLVhqN2Xl0J0BYxdVB61fTWh25dBCDdAuVHzi2z+wqk2rRp9T6qskt
 hXzgHWwWgAq4OQveeNuzWAPliLCeUHnesUe7+YHPH894jbFYFKJwWvRKpbXeCFj4HY9S
 VYCXrbM8y7beAvq+/9XzFMtu74Hr0qvzAVMvNZc5C02tYNPdba5OwX9jg+8qY59KEq9x
 Jv5cuZEbGaC89ekQlFjrlDd7qZTBci4kamJqbapt/Kc4qzihbXGD52wcbdmYrkkbQSrj
 1qDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+Q01I0tnLZ2pvPB6K7ZGqD6ZeWDlCyee/2e2OJTawFQ=;
 b=SQAMIa1B1yMghsDHbSWh+lNLEL1oWdrNSY30gmjS8zbRfsmfZJ7Nrac9cuyehZy20F
 8ohQDKyUM7s1AfMyCwnY4YSIOCNiMBdhZg+P+LmkbVyz7yWt7XZuL48QLuoOFcEvIW3k
 moUICo8Gfdp0SiQGxFuejA1gvaZ7hFtWnrxH9ztLjLcEsmu8iE/g8iqyNEYOuMVOSm1q
 9q9ezKfMT1CBguir5h3gyLlNIvMVWjIvBEQVgnPgluLZKfA+bImu6qa2AhpEJKg/7uwv
 ZkN43VFI1uhsCUCA6uGRpmJrmE1ytpxspa4QrpXueA8wxLZT208/RXGPxKf/s4ialoYS
 AdQQ==
X-Gm-Message-State: AOAM532kxnv/CPZHIfaMBD4BwVC5jEMkukXIZ35QWQoTc1d00lmG4gcY
 mLKlotM2gGFv0mOYvgYrPUierw==
X-Google-Smtp-Source: ABdhPJwDPi+0cJtvli6vlltIsZmIy1ISGf9ToEvDVvCWx97W37quJSf9F1r3Og+0K/juGaG8PS4BPA==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr10005449wrj.125.1617284615447; 
 Thu, 01 Apr 2021 06:43:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o8sm8258167wmr.28.2021.04.01.06.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 06:43:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 81C981FF7E;
 Thu,  1 Apr 2021 14:43:33 +0100 (BST)
References: <cover.1617278395.git.viresh.kumar@linaro.org>
 <6dbe80dc7c82d9582db1b8fc4493d253cecc24b6.1617278395.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 2/6] hw/virtio: add boilerplate for vhost-user-i2c
 device
Date: Thu, 01 Apr 2021 14:43:28 +0100
In-reply-to: <6dbe80dc7c82d9582db1b8fc4493d253cecc24b6.1617278395.git.viresh.kumar@linaro.org>
Message-ID: <87h7kq15oa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bill Mills <bill.mills@linaro.org>,
 qemu-devel@nongnu.org, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> This creates the QEMU side of the vhost-user-i2c device which connects
> to the remote daemon. It is based of vhost-user-fs code.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

