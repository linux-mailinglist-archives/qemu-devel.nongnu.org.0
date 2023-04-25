Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BC6EE1AF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:14:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHYL-0005ik-Rd; Tue, 25 Apr 2023 08:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prHYJ-0005i8-Hu
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:13:47 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1prHYH-0002nE-Vx
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:13:47 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-507bdc5ca2aso10101606a12.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 05:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682424824; x=1685016824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TNcSyrorUVfikrWr8sPHJsR2LjW0o251UKDh81rBbI0=;
 b=nnJMzy4ahwVQzUsDXEnJ0TjgrFDBr2LakYS938/IdOT3pJQ7jii3KcAR1tH8+S+Jc3
 oIktxdYusIJYhjXQZDCZ7GfX+KCWCkVBFeQZl6mwcs1SKTaNWRdDtgEtJNIA/3i36vXF
 nfPC37XjXJXzdliqJFKrxkUM/JW4t014B46MRaF1qZgPELx4M3iDVaF38r8Sa4MOeChm
 u/OVBQXjxMYig23Qm3gwc1Bv2aFA6/CtIo+e1D50DFdM9xrCurHMbTzq1psyp51CSSv5
 Uf32uKF0PoR715PdDrDiQuZz7o4lB8QW5YIWXRCag3yARnH2RilqoTt9oRM2tjDl3UWl
 0THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682424824; x=1685016824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNcSyrorUVfikrWr8sPHJsR2LjW0o251UKDh81rBbI0=;
 b=CUSxMKr+tJvklIMIdt32neuGQjKE/o1Lm6IhXUktrMSeOuiGF1bexU4Rk6/i0pEv4C
 sIJYs0ZOa8tjfPnek36tKsp/+JBd8mtiHNouhFfYgCro8cmFhQ5zB2ed6dR8QY0JJxzX
 cv0GnYLLL7X552EHQF0eAVW6q5MP+g4Blp9f2j3yFnWdy9nfKBPOtfhuNzht7v3VjvJf
 BH9DuNZ9Nia9FYMGayXx0q4CEP287vI2wzu4CsO/kHJX+lA66vIfVqoDFZf0DjvgOpY/
 l9HbF6wMHYw85AlvahkKI8z3UqPstQ4GVTgr0DoyChoUbQEhk02LnWoEbMn4KCvOr1We
 YUVQ==
X-Gm-Message-State: AAQBX9d+SyDBvI9t+NctmqnDTj8lss6IeQO9gOLsTFLV+IwM+8i1jKUe
 bF2WCWadflXBFdXtWtF3xejIgDskaTjle7YqyVfqQSFV27gaEqgA
X-Google-Smtp-Source: AKy350Z8X/qc4NxHxTf+nyfcJXwquacpCLKskkj9XIZtpyjvBkMc9HcyOpGuC20crNBklSO4hMBZHUfkY7hrX3gHYE0=
X-Received: by 2002:aa7:db44:0:b0:506:70c9:b870 with SMTP id
 n4-20020aa7db44000000b0050670c9b870mr14142581edt.3.1682424824240; Tue, 25 Apr
 2023 05:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-11-peter.maydell@linaro.org>
 <87jzy18oqv.fsf@pond.sub.org>
In-Reply-To: <87jzy18oqv.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2023 13:13:33 +0100
Message-ID: <CAFEAcA-T7jYeCp9Sqx8nMNeDL2Dr-U0=5FSCyv7QW58Eimto-w@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Apr 2023 at 13:10, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > -# Notes: @singlestep is enabled through the GDB stub
> > +# Notes: @singlestep is enabled on the command line with
> > +#        '-accel tcg,one-insn-per-tb=on', or with the HMP
> > +#        'one-insn-per-tb' command.
>
> You're deleting "enabled through the GDB stub".  Is this one of the
> misstatements you alluded to in the commit message

Yes -- this field has never been anything to do with
GDB-enabled singlestep (or for that matter with
emulation of any guest-CPU architecture singlestep
functionality). I assume that whoever originally wrote
that text was confused by the terrible name of the
command line option/global variable.

-- PMM

