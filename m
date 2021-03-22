Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC7344BCF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:39:13 +0100 (CET)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONaC-0000Da-22
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONUh-0004Cy-PZ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:33:31 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONUf-0000lk-TV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:33:31 -0400
Received: by mail-ed1-x533.google.com with SMTP id h10so20093800edt.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=glJSf7YlZCDeqAIWO9isv6NRlkZeqcky6yE8J+NKZdM=;
 b=kM+8d4szvchUVRqqIkITFVYRI0xGnvfMf+MYIpqqHkd8J0a8QhY+BCwDQuiB8fZiMF
 uCFtTnd1NzIKv6BsQj1zajQR41S14V7qiFVbRh7Lf1FoeO5SXpsCEfkxarGBWqAtqHY9
 TS9JoevnwD3NupuvgC+NzMMALgnZ9u5djtXMuseQeUHe/NmMIm4+/GD+9JpJakjvV9tm
 H3R0baRS8Jr3VD7z+vkMyspEqel4ckm9HQFmHN2T3wTFicDqERCaNa/KtvFYHC9UjSQ3
 kJNVnDKeuGIMIBuWAYrXZX124Y/H+UFqolng0XUkbhkS/komZyd5npcH+k27vaMxlR6/
 2btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=glJSf7YlZCDeqAIWO9isv6NRlkZeqcky6yE8J+NKZdM=;
 b=eoTfPtXqhIZVseAAdesX68UfNVrTVsGeG11G194q/l3S32YjbfafIRINqa5JUkqIcM
 K8A8nCOBkYBlZ8L6q4oz7a6gGHleKg6yYr0Y0x6sBG8zLAx3meSND5hvMXSZvcRwS8DW
 W+dZLqLqKPz2o8j5USXzur7iqDqWkYvy8nNExBq75Zlx+p6Ew4euBlg7USeU8jFxzyA2
 uv6V78KcpR2nS6cz1/l3Oz68xvZ29IDS0dJJn1LKUHzW+wxucGJpXVgpFkJBr6dhsAjv
 H3ahWJiWjF49QFLj1VcLSdKZOx8RV52ieFIOQjIQ2ZYZ1j9wCHTv422d/qomN8CBhMP+
 j/4A==
X-Gm-Message-State: AOAM530GHxyJf9f6fJtJMnlIhDqs3695cjEJBYXMZ7Q9JCXEq7krpGu1
 Dm4CDI2Oje/qcEj6tCwpaV5CXw==
X-Google-Smtp-Source: ABdhPJyp9xgFpTpsNp0VKzDumf/JRVF20crT8zEU0wmN/VkaHMs3fjG+MKaqVmLUn6pQKidBFJ/WXg==
X-Received: by 2002:aa7:d4d6:: with SMTP id t22mr444648edr.376.1616430808373; 
 Mon, 22 Mar 2021 09:33:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm9883124ejt.18.2021.03.22.09.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:33:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 647151FF7E;
 Mon, 22 Mar 2021 16:33:26 +0000 (GMT)
References: <20210322140206.9513-1-cfontana@suse.de>
 <20210322140206.9513-5-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v10 04/49] target/arm: tcg: add sysemu and user subsirs
Date: Mon, 22 Mar 2021 16:32:55 +0000
In-reply-to: <20210322140206.9513-5-cfontana@suse.de>
Message-ID: <87ft0njgh5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

> Signed-off-by: Claudio Fontana <cfontana@suse.de>

s/subsirs/subdirs/ for $SUBJECT, otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

