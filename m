Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3A31B82A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:40:53 +0100 (CET)
Received: from localhost ([::1]:38722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcFH-00062I-P4
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBcDu-0005Ob-U8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:39:26 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBcDt-0006Gm-Be
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:39:26 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o10so4119818wmc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=q52pIu0MKZpQ5T5uk9OZ3jDjxnL8xqCw+UWPoJbOitw=;
 b=emUGMtZOlsEu+allo9GSgo9SzEJWBOID25ANc3+vM5NMQDnkiLhvz34AvhNMdSfuc9
 tO2qUcXyuTR2jAaEsGn+N6R5i1aPDt/aDpiL370rrOwzMc5DFAVoQ3oxMxFFb1mcQdla
 XgOLq4sWOa/6MCNF8VXYUlYrIXtzRKsbdFyLkfzwqyzYS72PSjhDIAIWj2SqpocY2+6G
 xF8/S1rxgdqpABF3WUpBFZadSTQxHmIT5Rj76CXeAETkA02hDr1teqqO4jfQL7HhnfC8
 AgdpEa1+OA9XdzC3l+sR65aWO923nmS8lN3Q2KujX/006DiSvBpU51MkWy/EXFrwdxXm
 OdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=q52pIu0MKZpQ5T5uk9OZ3jDjxnL8xqCw+UWPoJbOitw=;
 b=rR0ef2P5XixRYY330BbHfQfrg83gjd1FaM0P3cxEoYn3HnG2hQXvXYQITaKmBCkFhR
 XYtc9te9cwz25usoDLaSwXdnLJdFLEaOjIQXlDqaURNkn5aBX2+7sNdgPvRPI9aBUkh7
 I07zjtWL17MRpeufoAYULm1t+LWmDIKSc8CwytDabg+50K2i2kOJHP97WE15kyPZqN89
 D+VLheCZcC5k3QsHY6fYTnhVuhL8jeBN1PNsAU63JmA9G6dI4/2n1MznXZc0qGMDpoJR
 G27zl+728B8imXf/rGMEmYxm5KOk73SFf4qYAN25AX0MG6RctF94t83i91n9enRVW75A
 XTiA==
X-Gm-Message-State: AOAM533EKFmy9QueLyc2JJscPVZGXuTuNWb2TKIx9q3iE0eRGtGt5kaE
 MQA/8rBFwLOuyuQTi8+hJUtkhQ==
X-Google-Smtp-Source: ABdhPJxIsx9wlG7rIG3nK+KVI+T+rmrcC93j2nWMqcVlHLmzB/UR7i6L5NeAmz2yxx80iO/X+8pyqw==
X-Received: by 2002:a1c:bd84:: with SMTP id
 n126mr13406144wmf.173.1613389163771; 
 Mon, 15 Feb 2021 03:39:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm23836068wmg.44.2021.02.15.03.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:39:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0752B1FF7E;
 Mon, 15 Feb 2021 11:39:22 +0000 (GMT)
References: <20210212123622.15834-1-cfontana@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v18 00/15] i386 cleanup PART 2
Date: Mon, 15 Feb 2021 11:37:18 +0000
In-reply-to: <20210212123622.15834-1-cfontana@suse.de>
Message-ID: <877dn9v9ue.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

<snip>
> Looking forward to your comments on this proposal,
>
<snip>

So I've reviewed as much as I'm comfortable with - I'm going to defer to
the x86 experts on the split of stuff for x86. However from my point of
view I think it's a nice step in improving modularity and reducing the
maze of #ifdefs in the code.

--=20
Alex Benn=C3=A9e

