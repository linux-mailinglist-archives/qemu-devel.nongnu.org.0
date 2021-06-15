Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAC3A7C8C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:56:04 +0200 (CEST)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6jj-0006i1-1I
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6iU-00063C-UV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:54:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6iT-0007Sl-5z
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:54:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id y7so17796354wrh.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=CWPDeaP4WyAxAace2sZNGqE4nn3tJAOWMZzDltI4F2w=;
 b=OozMnNtXwoTo2/Knn93KxYSYMiwmCLVeF5CDVoMzHO4JmP6xe2+rpQJoE/1vLZnJgc
 EBr/oVivFmKblicwR9Uq/SS1xcPYJdvWFb6klCTrq9kHu0ga5i7o7WR1F0ZQ6oLTqhuz
 WQI31I8s0IGWbWkQDJzVZy+zju8RZ7I1LwM7G9y6v7qv7ucUMs+JBtjhTtD0DQhVEQUL
 PemsGOIqa+hlR7ZeZxy97W5DyCyBXqYFBk/vdkX39DI3R/lvRPbAoEnl6CZtSD5K+4+R
 CqMJnxJ/uc0yjNPo6YMiRITFJDi48QXzCEv4FIUWunGSDlq7JJCrIDGnba5R4zRCvi58
 KQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=CWPDeaP4WyAxAace2sZNGqE4nn3tJAOWMZzDltI4F2w=;
 b=sFo4uJolNn79ybjtrfcnX5W8IZjqtg9JAjHX39puwAzfXa23hNLdAtVNbt8Ktw5j5r
 PJKNyvQ1VqVZq7nG7GCQhEyhEQ5YGF45vVW39uJM7L/sJ9G6KSGkTVbECj7KEO/1PWPX
 4x1HXf0kYwWgxrDGIZ1zlSGdfoPqBbr3Ptj/Cz8ZlIbsfVPn7W2RIyV0YrJ0tj4QviLl
 6/sbD08jWrAaMKUPvz2cg/Fu/UJkU2uRT0ASOJuiAxN6ncOAI/LrMZlfZNygZr+WzL/Q
 dmGe/YopMrYJBVkE9hM/4AJQIjHGt3QImZblW0ICSa/qwPLqeGN5xu0K9cPrjIvOlIRo
 LYYw==
X-Gm-Message-State: AOAM531w6rFTjK29yY1fdwNn6aFotUHxo+jlQubwBfnUYEU/+g00rG7g
 EWt3EZtOp5rbGh6TiOKnSz4fhw==
X-Google-Smtp-Source: ABdhPJxPq5acWgH7WMhDoeW8HHBiIdv/NFo+hI0lEzPQ5TSZUnaoiKJGheRsOyHzj1HaJojpRUD6Sw==
X-Received: by 2002:a5d:648a:: with SMTP id o10mr24148534wri.274.1623754483515; 
 Tue, 15 Jun 2021 03:54:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm10464114wrv.37.2021.06.15.03.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 03:54:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 594031FF7E;
 Tue, 15 Jun 2021 11:54:41 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/8] util: Use real functions for thread-posix
 QemuRecMutex
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-4-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 11:54:41 +0100
In-Reply-To: <20210614233143.1221879-4-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:38 -0700")
Message-ID: <877diviej2.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> Move the declarations from thread-win32.h into thread.h
> and remove the macro redirection from thread-posix.h.
> This will be required by following cleanups.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

