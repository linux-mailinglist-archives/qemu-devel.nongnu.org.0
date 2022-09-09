Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B705B3D38
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 18:43:07 +0200 (CEST)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWh5u-0003Zm-Ri
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 12:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oWh48-00021F-9Y
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:41:16 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oWh45-0007xh-VN
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:41:16 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id 11so3567618ybu.0
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=bgGnDvZe+c8LuII7vL8lyuG/HfKB3YZ9q2O3O8JNa6Y=;
 b=DGcrrQqrVINJyiEP0Wl1JfOTeQHBaNjexSS35VrnO9NKAqhpRDgqmW11Fp8ua/e3fs
 T0fAKYpaARKFY8Mi8E88PIw7iEe11mDmrDTEBdC6EH6EMItLFdPIf00rMQimKY4bicj/
 hMXIWYi6FIkD+kKrdW1n/lJcKIO5Zm+ap2E4dfNm/ajcfuxCq2H8z9HOPyJ9bb8gjpm6
 ZEtggAswTJqd9WVea4GLMuOgKQNkiS5GYKGBSbaA4323FCZjf7g3VBrEhEcMKAXpHFaj
 MBL3X9L/fi6cGsTmub0sbBUAcRZuuZESQF1FW5KcLbGtFnelsoRR0eC8zFOQmiEvlUuy
 gLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=bgGnDvZe+c8LuII7vL8lyuG/HfKB3YZ9q2O3O8JNa6Y=;
 b=a/fbtm5q/gb8uMk1V3U6thbPIiWYb/c0YqXtvHcBw8DW1XU6M2ZhLhGr9aycdtwIoD
 P9cm/dJMmFiKy8L0kUvHbhaT2bi+sm41OyYMjh2kjD3wDxLn1YZ5WxDC8GfeyJTyOuCP
 gwRYTvdgAuEHNHv8QgExUTiFNKkBaK+dCGeGYYe8l92Ye1EGQPX/5DqFPQl04QS27usc
 xmAmtD6pyEZdREN9nDbSaBgWsJ8JRgPNntAWyRIIE9hRFHpU2UTLnmcqO55AWqBoe3vi
 0tm0i5pRAn0wts2kU7U6Ukycv3FU34PPmXdlttezaEy6tm/s7nK8xZOX0xFhfyygKMgH
 0CSA==
X-Gm-Message-State: ACgBeo2npsE3VX8GRVUJQxpDkMDzkp8WL8eEejAVA71vmUg8pF6r/9wA
 DCL8lGPLtvNW/V4YaLnkIjdYyah4M+hnXFHRKC3ZXDJjy8VdDA==
X-Google-Smtp-Source: AA6agR5RY/2oQd4lrulLn2+rBTZfgXRkdV7rpoL5+RfvohZSehc3cwvtLvUW+qJcvu50DqJQC2ZMLGbHNaoL0JSkFXM=
X-Received: by 2002:a25:af41:0:b0:6a9:3f9c:b84e with SMTP id
 c1-20020a25af41000000b006a93f9cb84emr12650243ybj.537.1662741672707; Fri, 09
 Sep 2022 09:41:12 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 9 Sep 2022 12:41:01 -0400
Message-ID: <CAJSP0QUn5wianZaCu8Ka=eu2uuwtwTnTLD-P9pkb+PxFd=1Mzg@mail.gmail.com>
Subject: Call for Outreachy Dec-Mar internship project ideas
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Frank Chang <frank.chang@sifive.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear QEMU & KVM community,
The Outreachy open source internship program
(https://www.outreachy.org/) is running again from December-March. If
you have a project idea you'd like to mentor and are a regular
contributor to QEMU or KVM, please reply to this email by September
22nd.

I have CCed active contributors based on git-log(1) but you don't need
to be CCed to become a mentor.

Mentoring an intern is a great way to give back for the support you
received along the way of your open source journey. You'll get
experience with interviewing and running projects. And most of all,
it's fun to work with talented contributors excited about open source!

You must be willing to commit around 5 hours per week during the
application phase and coding period.

Project ideas should be:
- 12 weeks of full-time work for a competent programmer without prior
exposure to the code base.
- Well-defined: scope is clear.
- Self-contained: has few dependencies.
- Uncontroversial: acceptable to the community.
- Incremental: produces deliverables along the way.

Project description template:
 === TITLE ===
 '''Summary:''' Short description of the project

 Detailed description of the project for someone who is not familiar
with the code base.

 '''Links:'''
 * Wiki links to relevant material
 * External links to mailing lists or web sites

 '''Details:'''
 * Skill level: beginner or intermediate or advanced
 * Language: C/Rust/Python
 * Mentors: Email address and IRC nick

Thank you,
Stefan

