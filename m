Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AC1344AE5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:18:11 +0100 (CET)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONFq-00061a-11
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONCC-0004Bv-QH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:14:25 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONCB-0006tZ-1Z
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:14:24 -0400
Received: by mail-ej1-x631.google.com with SMTP id jy13so22209814ejc.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kF3UXRO7GwkPngEOfvSj9xbzqWWtYyDSpVN6Jh7YrEA=;
 b=fy6zxqISc7d6AmgKX1vDUGD6hRzyjGoTsOwX/YyU51lPwLSaLmQpxsDYQRqGtSlWDy
 IqjjV827CWkO//Zuzexhfk6G61pOVhoezuzrwLML1oJG+UNaoW3nDRRTifMxIetg8mlf
 bBKZRv8lHMp8/nnyDV3PPXZrKYDKPrgEsXx2WwDSZ2nKopVWSMMj8YnJFzwlNeNt7O0T
 nxgevNMFt4pMedIscMPRH4Kb0+4t6jKI2S6vtndP81tE8e5H0lBY4ZazAnFn8AlHAgMv
 hHnXfu3hWDA/9UWXHtvQHvZum+IqdseeTTcWl7cuPHBenGZKXdHmOkJN88VBU5+GSQsH
 /ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kF3UXRO7GwkPngEOfvSj9xbzqWWtYyDSpVN6Jh7YrEA=;
 b=nTE+hKtOMFHwV0RnpMVK2yskApv9UTFgiQ1FWG6X2YNIlqNXv6MkZ+iGQlEg61+7pR
 f8nRftctd/yanzVI3tvq9nVw2hY0EIil/4Sz5/9QpXt0sX2Rt23EDwWZ7NblYe7kkbsM
 LNrwaIc5YhSUod045y3fUgLYq60EvLVMKbLz9pMYpkGjtX4vZbTOUUaLcqw+LtYW89yQ
 bsd70XGLMTIW9lsqKlOM8hFrRflrWrSH4eRZR95QS/S25rFtP1l5NYdLcpQTuta2bH6O
 OgckxZfdj/fArpB9ZOVhiD0OJc/dUtB4g9uIqbC0O2b378x144+zgcC8KMozDeIB/FhR
 EFvA==
X-Gm-Message-State: AOAM530xQ1M5VWSFxN37l/l71LXsMUhjLdD85C6RbBQGGtavD4O0/5ra
 cJ2jPc/aHZIRknu6nohiGS9cfw==
X-Google-Smtp-Source: ABdhPJy5/3bBzbKNK13rf/4TB3Qaz+99vsHTngDG6Sq85oxhhwl+jXe0/Aw/LnElaZWfvyleww83oQ==
X-Received: by 2002:a17:906:2b46:: with SMTP id
 b6mr501602ejg.521.1616429661487; 
 Mon, 22 Mar 2021 09:14:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm9856838ejd.68.2021.03.22.09.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:14:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E52F01FF7E;
 Mon, 22 Mar 2021 16:14:19 +0000 (GMT)
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-4-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v28 02/23] target/i386: Split out do_fsave, do_frstor,
 do_fxsave, do_fxrstor
Date: Mon, 22 Mar 2021 16:14:15 +0000
In-reply-to: <20210322132800.7470-4-cfontana@suse.de>
Message-ID: <87tup3jhd0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Richard Henderson <richard.henderson@linaro.org>
>
> The helper_* functions must use GETPC() to unwind from TCG.
> The cpu_x86_* functions cannot, and directly calling the
> helper_* functions is a bug.  Split out new functions that
> perform the work and can be used by both.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Claudio Fontana <cfontana@suse.de>
> Tested-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

