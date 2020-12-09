Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B392D402A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:44:33 +0100 (CET)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwxU-0008UD-6W
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwsb-0004Xt-2d
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:39:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwsU-0007re-Qj
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:39:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id 3so1120282wmg.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HRtw0YiIThgtylpuMqmx+UhRjwLwUiVTGqlmczHD6SA=;
 b=dgALy5Ue+3o1blRMJWcoZEOKEE05a1V4BXGvmC7/TvbAYB3vZIl1LrKi4TNFW+S9gg
 xb1qCSdy6CfykySMUeEX1bfDiroIdBJbX8ASjxAFFZP0vD6YiPlpH1rGwC0opMJysHjR
 JuSDryPBWKoaFXbn7aN/pYin0vLuBQgl5RvQx2MMtfeuuQ3B755ItYDZ2qVTR4lVbJXU
 K2wYn6Lbu9obNxoAG6P+ONXyAZFaqtZIQznFSUmaNp9rL1lpEYKbMkt1BHLbXkPRkBQ+
 jAXjAfNrmTWT24iFYLIfzn6GD8sJm/GjmNA2M/yyJmL3rFhdUdxnro8HaNbuEOVmDdHW
 Cp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HRtw0YiIThgtylpuMqmx+UhRjwLwUiVTGqlmczHD6SA=;
 b=gW6Yn4EMwUyNsoE8hZikcqS9R222tAP+3uSGkG43T1mz1Qd55ANLUY/tfFIOoCu4vd
 +6FTRWwHOivcaZ3XW2PukDV9zLELY+/Ol7pEDsmTp+CQpZ3l9JXKpUGy6Vlt9Hkyq5yc
 10L2ltIZQ/sq1u3UmgQYR6iuGnGPWy8oohqhNnmiaGmxJIywbb+id7AIpv4pgg0X6tie
 bVAQu/V6UQk3BqIMMtbCv4hAS199Lao3etZaLmiBxDkRTN2DYqJ3Ch2X0fQYeogj5uX+
 5WolSWl9u4K30g6cwtHsPoUJ2XBOr/xyD+LnqjOUQZY53kV65v1Y8otQAk9uLSyw9lma
 iBtw==
X-Gm-Message-State: AOAM533byBMdj8cgT13/EBjpUejLVI7KoYWEZtCrOPuqZBoh1HyF3Pmc
 0O1SMO7qCRWq9iUyhwTS+gX/nQ==
X-Google-Smtp-Source: ABdhPJw/qqekJ68MwAcMAEvX42qwK61t3TB9aGIuCF/28ufJdtQm820g82h6XOffViTkpj7rcmhDcg==
X-Received: by 2002:a1c:bd87:: with SMTP id n129mr2079452wmf.32.1607510361314; 
 Wed, 09 Dec 2020 02:39:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a65sm2327221wmc.35.2020.12.09.02.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:39:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 863BE1FF7E;
 Wed,  9 Dec 2020 10:39:19 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-16-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 15/32] cpu: Introduce TCGCpuOperations struct
Date: Wed, 09 Dec 2020 10:39:13 +0000
In-reply-to: <20201208194839.31305-16-cfontana@suse.de>
Message-ID: <87o8j3e014.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> The TCG-specific CPU methods will be moved to a separate struct,
> to make it easier to move accel-specific code outside generic CPU
> code in the future.  Start by moving tcg_initialize().
>
> The new CPUClass.tcg_opts field may eventually become a pointer,
> but keep it an embedded struct for now, to make code conversion
> easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>
> [claudio: make the tcg code build for CONFIG_TCG only]
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

