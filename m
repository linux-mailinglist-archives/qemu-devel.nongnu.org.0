Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898B4AC801
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:54:56 +0100 (CET)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8E3-0002L1-4G
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nH88d-0006XM-DW
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nH88X-0001iR-3o
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644256148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgsFvpmwWV+1WYl7oI/59x0phUQqjjkP3Wu+d4G8Wi8=;
 b=Nsp9oQ4uXOX2L8ghkeJPgVLIccnx4wT5slWvXJ7dD4k3dQhLD71WjFRIkNFbUyBC5ZJ+UG
 ID2M2rjvBy+JZTR0bg5+i1LpAT/zY0Ts8gbbzzc6WoNmDAuqYIUamvrNetZq5lgwskwXKz
 p1jCi5x4x0213yrZFbFrYBNxUl8wJok=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-KdXvSooLM_yjgU2hsnAN2g-1; Mon, 07 Feb 2022 12:49:06 -0500
X-MC-Unique: KdXvSooLM_yjgU2hsnAN2g-1
Received: by mail-ua1-f69.google.com with SMTP id
 c11-20020ab0274b000000b0033c91f4b0f3so1335975uap.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HgsFvpmwWV+1WYl7oI/59x0phUQqjjkP3Wu+d4G8Wi8=;
 b=JxDRMEAEwujKoKxcwA/bxWNTkDtPNfL5r8+S74s1pqom1Qz5DhHWvwy57sh2eN338K
 4liP49nWQv0fD7X2K4vJ1D6yb/lLWVL98XRlYhlp7FZAbaD5Qk+tOsCAvYl0EUfxc8nj
 x68u34Yuj07y/NDf7p/WJsdOvQmzlwHwmTnJCqockBBQy7b22bCbGoXdpEgaikA5zgi4
 9TfmS85BpVyOOXWAq9jdOTWo8rzdl4H34c43qXr/M/l8KDkuIwVrtFENQugNc83TNjNp
 WZlCkJewwSTSvpfADEDr61oUrhvawU6JJnnHANctgPPdbCrdIe8yrsVKkUFL/8gNOBlj
 qQOw==
X-Gm-Message-State: AOAM530/o/ML4H5mljwZlph+w7TtFxo1c+Po5hydzT7mVlcnpgcm4bL4
 8RcBM9abKvxbX8Jn3o+TZCl0TIjsoFapsGM+5bgmxqSS0WsaYoHLAHfLv8ImYtoJffBzNy42k27
 nIol/o7rOxNPwQyc5KVsMqvds3wuAKHk=
X-Received: by 2002:a05:6122:d07:: with SMTP id
 az7mr321437vkb.35.1644256146348; 
 Mon, 07 Feb 2022 09:49:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOp7+SJ3ZQjruxJPrcySphdOIwJAdQr30NgqDUQA2MR9e+kZlD1OMvceDBkenXdnhsYtgVUfe9iA3lK1JMo9I=
X-Received: by 2002:a05:6122:d07:: with SMTP id
 az7mr321432vkb.35.1644256146137; 
 Mon, 07 Feb 2022 09:49:06 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
 <87czjyhaza.fsf@linaro.org>
In-Reply-To: <87czjyhaza.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 7 Feb 2022 12:48:55 -0500
Message-ID: <CAFn=p-a4qSvmdZpVhxG96dhuDR5LYhAeJ_uQnj2t7oLEmn20nQ@mail.gmail.com>
Subject: Re: Adding a 'qemu.qmp' repository to gitlab.com/qemu-project/
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 11:56 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> John Snow <jsnow@redhat.com> writes:
>
> > Hi Peter:
> >
> > I am working my way towards splitting the QMP library out of the
> > qemu.git source tree. I'd like to ask for permission to:
> >
> > (1) Create a "qemu.qmp" repository under the qemu-project umbrella on
> > GitLab
>
> No objection for my part except maybe a better name? QemuPythonQmp? I
> guess the header text can make it clear.
>

At present, the package is named "qemu.qmp", which is the import name in Py=
thon.
("qemu" is the namespace, "qmp" is the package, "import qemu.qmp" is
how you import it.)

I figured I'd just name the repository the exact same thing, but I
realize that may introduce some ambiguity at the QEMU project gitlab
namespace level. "py-qemu.qmp" or similar would also probably be fine.
I think I want to avoid straying too far away from the import and
package names, if I can.

--js


