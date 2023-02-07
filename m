Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D125668D508
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:03:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPLjw-0006X1-If; Tue, 07 Feb 2023 06:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPLjb-0006QT-Vf
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:02:07 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPLja-00051Y-CD
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:01:59 -0500
Received: by mail-pl1-x631.google.com with SMTP id r8so15273980pls.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7CzbfN26yiKy6KKrnWOj/Xeqlriu5Zesrh7d/IYa7D8=;
 b=yrylAmsHnEtPQTO54mGtKMJxYeqjfn/3hHWSTvf3torOFTljsfamI3CcfPMw/CSY1t
 t7W0KxbogxEbDqW3vFi5DHRX2tQ3BtaxkYfWsM/0uQsZayTcdBnGAHgaDq+LeQqX1Fpr
 hHQo9F1g5dH3/bJZ/gvKLEVnrqkCj7FrPA19vkRZ5ASvkdDIaIOlY4ltGVNMbNE23NJG
 oCwgPHLvumGdqc0qTm6UfMFjC6HzTcCU30pQdwv1mFr/1a5b1g0XOSspBD5vCVX0CrOM
 pPBIHLn/0dXnh1ArV0AN34QpNpClqgKcTkUXxBpT674gX+8LJcQ1egIDvbClX+IYkLma
 uEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7CzbfN26yiKy6KKrnWOj/Xeqlriu5Zesrh7d/IYa7D8=;
 b=CUkJew/Iv7gj3NMgTTObHJrONsIzyRfPB71icT2XP12850zUJYcMxXwrUUxAEHIlEq
 FoqEv8iJoCO+vguBhY5C2Lse3ArvTzuDC7dDHajNlchOkLU1Ho9Cx8IKwBId8Oxkdb4t
 /GtDJq4N1CCeNLHs0mfq8WzP4CcG7LNU36HfztovOA4LbiGpvApdxbOe6fNibXtody1z
 Olt0WlP5n2SqjbVCo+I0/gBVkLp7hSs6LpWbFsI57d/Ygddma2bobWWRUil80U1VtnZp
 ge0sqZYwxVdCOxtf+MECLnlzW9eGQW6eaMs3rOSM/77US4sft2QnXOGgQfOPLKI7YX5n
 lpfw==
X-Gm-Message-State: AO0yUKUZ8XJqsZ1zio1Q+PThHGETxQWHaJIc4OTQY9cDMo+Et7c+eGeF
 XL0xYH4PgADQ0Y1C3zqiRl57FncOwjUv7c21KZ4lKg==
X-Google-Smtp-Source: AK7set+OAyWUqsSp0KAs9JKzzoEc4FR4AM4/poQ1O37I43nJmfK6U5UuVgSu3PYddppcotft0ioXMlGl6t+LTN5CLrg=
X-Received: by 2002:a17:90a:1141:b0:230:c24b:f22c with SMTP id
 d1-20020a17090a114100b00230c24bf22cmr802012pje.53.1675767716313; Tue, 07 Feb
 2023 03:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <114a7eb2-f503-361a-aac7-ad9dfa7696cc@redhat.com>
In-Reply-To: <114a7eb2-f503-361a-aac7-ad9dfa7696cc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 11:01:44 +0000
Message-ID: <CAFEAcA8x_qPzoJ_TPGMin6FKtXfcpqLSbdFTiu9JT+bTHbQbog@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Mon, 6 Feb 2023 at 20:18, Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/02/2023 18.13, Peter Maydell wrote:
> > The command line option '-singlestep' and its HMP equivalent
> > the 'singlestep' command are very confusingly named, because
> > they have nothing to do with single-stepping the guest (either
> > via the gdb stub or by emulation of guest CPU architectural
> > debug facilities). What they actually do is put TCG into a
> > mode where it puts only one guest instruction into each
> > translation block. This is useful for some circumstances
> > such as when you want the -d debug logging to be easier to
> > interpret, or if you have a finicky guest binary that wants
> > to see interrupts delivered at something other than the end
> > of a basic block.
> >
> > The confusing name is made worse by the fact that our
> > documentation for these is so minimal as to be useless
> > for telling users what they really do.
> >
> > This series:
> >   * renames the 'singlestep' global variable to 'one_insn_per_tb'
> >   * Adds new '-one-insn-per-tb' command line options and a
>
> Please no new "top level" command line options like this! It's related to
> TCG, so this should IMHO become a parameter of the "-accel tcg" option.

That makes sense (and is probably an argument for taking
the deprecate-and-drop step). Is there an equivalent to
"accel suboptions" for HMP commands, or does that just
stay a top-level command ?

(For the user-mode binaries it'll stay a top level option
because those are all we have there.)

thanks
-- PMM

