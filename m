Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EDD40C783
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:33:08 +0200 (CEST)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVyE-0005t2-6h
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQVxF-0005B5-NY
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQVxC-0002Xh-7U
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631716320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3Y3NTGJqA3apuvvmXQVC0+CyFD89cMry+724875rd8=;
 b=UsUJ+iUbHCbfBnNRn1BsMCaUpjftzt3W9yjXrULTIEJq+fVBQBvBai/PzP2qVFnQrwUjfk
 sRGtzBWWRNgvzLo/jmx5xPEhRuAF2+vwof+pRoRPvXeY5JIdiWqPh7JKR4qfM8qJwLkFJ7
 mCsn/6ar0Y3kU3DnegIG+uEkDBqihuI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-JgrUZZDIOv-G8HNc3QxWzg-1; Wed, 15 Sep 2021 10:31:57 -0400
X-MC-Unique: JgrUZZDIOv-G8HNc3QxWzg-1
Received: by mail-pg1-f198.google.com with SMTP id
 z127-20020a633385000000b002618d24cfacso1847575pgz.16
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3Y3NTGJqA3apuvvmXQVC0+CyFD89cMry+724875rd8=;
 b=pYQtQgZGJDHnh5WTTarERlmEKPNpgJbvHm/d46Tzdtp0PX4K31ozU+Jiox9ZlF+xzv
 Elphhb4zA06ITw75MHHArJyBJnUfGRvSBbtLZHiGtQ/3hmSNt2smDAjG1yhpVFMow1Nq
 NcgmtfXSuAsQ69CDvMWTyN+zAEqpNVFNW2MYTzLYxsks7Qwl+rzSpSDcqsF/iMjkHhm9
 UsNxHIA9nOkj9kz2vWSAv1t2JV5IPvciPMlymiPrintbdIrMUwktKDq27dwjN6T5VQ9S
 19/ckIbsCubRJh4s/j7d7+spQxWo3+MnPQqnizgTsXl+aX6FjvLUEgIfsEWtXyTpDvH9
 nPbw==
X-Gm-Message-State: AOAM531wk+BpmgsThN2uPDaVVRb43YoJNVseQiWIegwfinZuxGywU01n
 v+wSEscNABNcoI+lvdquE8rMtYJDBWLCWys5xlKDgBkmJ1OC5A1jA+Tx4LjRPnMh1FxdLzyqsm7
 BAnZ6+my2GKhGzU6ksWvtIVVfwfzch54=
X-Received: by 2002:a63:b204:: with SMTP id x4mr88665pge.212.1631716315860;
 Wed, 15 Sep 2021 07:31:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy7aKwOyZ78oRDbOI366ZxYlt3pQQCBcV5+Z/y4+ATWC0aXSxuY5cCkS3jziOpoLyy04IM+QnrztA6+30njxY=
X-Received: by 2002:a63:b204:: with SMTP id x4mr88644pge.212.1631716315552;
 Wed, 15 Sep 2021 07:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-3-richard.henderson@linaro.org>
In-Reply-To: <20210914185830.1378771-3-richard.henderson@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 15 Sep 2021 11:31:29 -0300
Message-ID: <CAKJDGDZtf0uHrg8fwtkzwF66gTyrWhxYnMXpTbtQvb0=dw8o4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gitlab: Add cross-riscv64-system, cross-riscv64-user
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 3:58 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


