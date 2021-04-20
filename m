Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3872365646
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:36:05 +0200 (CEST)
Received: from localhost ([::1]:38668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnjg-0007gK-TD
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYnhb-0005u3-Nw
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:33:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYnha-00027O-3R
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:33:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id a4so37076631wrr.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NwOt3GLB7WvkAshqWmqVeiafFSCo/MNQO5nQmSCPAdU=;
 b=uAMeAwLl/E+FNb5sA6flnwe6gqDa5g2TacchADwpptCe8L0tjqmsSBcsp7zNXIgvhe
 tAML7M3HYFIFTwKSbC8XQTNbYsMf/NDNcO0ea1vwNN59/iwf6xjWf1TQ9JOPEwSh7GPw
 UqMm8IJZ/IQzyFCcUtMqCnvCqJJ49qqUbh0MUlT4QqOUCtt8CYtLrHqhwuT2qILKlti+
 n1VoTkV6ICukgXTPDmwPXXdxh9AflnJsaUN6EoWFDwsRBEZZN2E4VXhPZtM546hIMEA6
 R0+VDbXmIWeOI+hLXTfHoXESm45v4UKRE7eOP6GeeQC87gEOQScl7LWyP+l+jGfJqHmo
 Jjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NwOt3GLB7WvkAshqWmqVeiafFSCo/MNQO5nQmSCPAdU=;
 b=aKURUrBG9IFc6Fvc/798yVi0tnTYFSBuO0jXRtP6vc//lstbxoJlKM3kQmXhuUtzI3
 oFFudS7B85FrSEboGGJJ4cdK5WZI3T+EfmRuG26c2INuAkk3cLiQN3ymoYlgxU9X8WHF
 BiH5YNVawDOo0d0PbZ+0ep7iJESsHlWRzuBdsfI7ujgtnYNfCqoejlBYH0bMmV1d/PIH
 z8utmTjid39KO9yzUXwJAIj99pA8cjY+uDAW3a36FdpNghZxg/6xSx0SoAs5D3jq8Jp8
 1BjnYEHsHoBlcFXmD7kJM/YXzsZ7EmJRCS8qzelCu4hrvG/VKMWUlSc6THoAB+vP4cgv
 ys0g==
X-Gm-Message-State: AOAM532zWRvjMjouhp+PLgYX/82Z+LXr80xgFQTFzrbUSlQrCwmDW5Jy
 e0MkOuQQEdubTg3rw4Vza6CtJg==
X-Google-Smtp-Source: ABdhPJxoXMvcb4YAyijk4QjImeC5NxWyWaNXtdbGckQy9c+qL5xZp2qSPPApTEfQxMRQBGTUtDIDNA==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr19845730wrp.173.1618914832540; 
 Tue, 20 Apr 2021 03:33:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q7sm14263411wrr.62.2021.04.20.03.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:33:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28F471FF7E;
 Tue, 20 Apr 2021 11:33:51 +0100 (BST)
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-14-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v14 13/80] target/arm: fix style in preparation of new
 cpregs module
Date: Tue, 20 Apr 2021 11:33:46 +0100
In-reply-to: <20210416162824.25131-14-cfontana@suse.de>
Message-ID: <87mttt8cts.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> in preparation of the creation of a new cpregs module,
> fix the style for the to-be-exported code.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

