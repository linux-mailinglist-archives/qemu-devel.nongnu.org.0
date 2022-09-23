Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C759B5E82E5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 22:06:36 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obowV-0007c8-Fx
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 16:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oboqm-0004oj-5w
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 16:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oboqi-0001WO-SC
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 16:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663963236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikMRM2K7Gn40D1E5wdiVhtUJd2AViCY90UWnlhTZHHg=;
 b=exusXI6+7J7u07z1RJXw6sbrxp8fD24+oK1Xj1wzGASHEe9ogzM/MIMuk2IdcgdpLSo1n5
 avNyj2BOzt4UGWVLbAlyov7BsYNk5OKXH6ZCl0w/EkvoPqizEO82Sx2+SpRU9bnmSvuUZR
 XJ6NLoEqRLKYkEiAWfyY+o+Aiv8mKks=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-6gXqwdPvPwK6xb-thO1hVQ-1; Fri, 23 Sep 2022 16:00:32 -0400
X-MC-Unique: 6gXqwdPvPwK6xb-thO1hVQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 by40-20020a05651c1a2800b0026c4246ce71so319115ljb.0
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 13:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ikMRM2K7Gn40D1E5wdiVhtUJd2AViCY90UWnlhTZHHg=;
 b=u5r/cxjY1669IRfacTxJfGyKpLxuiViS5kLZAs/fXXcgtMYasuuu4HqM4miMr/1Ifl
 CqsesXlAylJoAK61XBef6QI3YqIl8eoMGP8JvHDVSI4aS8ba5CLP4Z79Xm6XWh7zQsnU
 jw+knp9Cs5FoJEm2LXGweXbm1Vu4Oprx2HilRZKepVhyQQn4owU/yDUtcw4NNXdVO4HX
 5dR97en6KFDWr8sElQCj/41HMjBnZf7JUZER6TxnnWwB9bfPLqmnQFY3vSbFI4SoyYfV
 qQxu+8qlrsMohVgFsIX3I7f0YRmsznMlGUNP2Eb2i82f30zbMDfevJ0gxAVqru3z8S6C
 9iPg==
X-Gm-Message-State: ACrzQf0L6GeGdgD0FQMCUk9A5tlRzjeAoT6Gas+NQwYzMqWrrSys6IPH
 exboj9PHvsDuUJGYRzc2ZUOoJw7AqV3yJMAmyBaZOAmLPhqwBsf7l/7hYEH87oq4a7tHDbii6gQ
 exnbVUaepMg3FWmEfUWiyqajGWAFrpVw=
X-Received: by 2002:ac2:4114:0:b0:4a0:6357:c362 with SMTP id
 b20-20020ac24114000000b004a06357c362mr302564lfi.140.1663963231258; 
 Fri, 23 Sep 2022 13:00:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Snru5tUvcihcV6uoMuPtecqK4+guzsCbvXAvmTbWgC0hVIX6FI9UoUSbrivjoZczNN++//cDCM/ihDqM/p2U=
X-Received: by 2002:ac2:4114:0:b0:4a0:6357:c362 with SMTP id
 b20-20020ac24114000000b004a06357c362mr302540lfi.140.1663963230857; Fri, 23
 Sep 2022 13:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-21-bmeng.cn@gmail.com>
 <CAJ+F1CJADsVjhEyLZUkU5HaNma13xOo7Fy8MUtesmRxMsWgK3A@mail.gmail.com>
In-Reply-To: <CAJ+F1CJADsVjhEyLZUkU5HaNma13xOo7Fy8MUtesmRxMsWgK3A@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 23 Sep 2022 16:00:18 -0400
Message-ID: <CAFn=p-btHX=fR_caj7JwswtgKZeLNEzFAU-O_gRtzRKMgfUYAg@mail.gmail.com>
Subject: Re: [PATCH v2 20/39] tests/qtest: {ahci, ide}-test: Use relative path
 for temporary files for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Sep 22, 2022 at 4:03 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 20, 2022 at 1:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> These test cases uses "blkdebug:path/to/config:path/to/image" for
>> testing. On Windows, absolute file paths contain the delimiter ':'
>> which causes the blkdebug filename parser fail to parse filenames.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
>
> I don't have a much better solution to propose at this point (to actually=
 use a temp directory), so:
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I assume we can switch to using the node-based specifications instead
of -file=3Dblkdebug:%s and just spell out the tree more meticulously,
either on the CLI or by switching to using QMP for the test. These
tests were written a long time ago.

--js


