Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012332D3E9F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:27:26 +0100 (CET)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvkr-0002Ho-0s
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvgR-0007j2-Pu
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:22:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvgQ-0006lG-2f
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:22:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id g185so880407wmf.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Wwu/JRkmjimiR8cPyQLB7dHWva2cwqgR+Vs08oyH2p4=;
 b=ZqFYvvmJJUs6L6B+VPv7h6ci07m+CCQt51Qu2d9ZPj/QzVydVc+RjtM72oq5gjsqrk
 SnceR0L7PMCmM6jqYcz1PMjxnGn2ilSwqZO7tnaloyZ911iKtTlkFlp09Jzthwk4t4sF
 qtnvaNwregfdAaoh28OwPQsyjlB2vVILcT99aVNLA6B1UQZXCeTjWq7uXCw5tYBu37yD
 iBzUqyIqlM7mMcRnuwBoa9PJ0/k6g9Gr/P9Yn6Mu2qNHpzAY0f6//N5DfXcYQ8kmmEZ+
 t+t6gLdXJJiPHW2mSyrWFqpfizC7AoPuyG2lvNFBSMY1o/vc2Kosde0A2Ij0/qStkPwL
 /ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Wwu/JRkmjimiR8cPyQLB7dHWva2cwqgR+Vs08oyH2p4=;
 b=BuhzngcLxxa738s75cCyVhy0b9TJU430npQEHfb2tEMYa8hDuM34PDOrS8QqC5zEwC
 UTd+BmQe9hvfVrzli7vlwmoaO3e5QvLCxD/M7ZLegJNQmPj3t6GPIwELp8hPgCmFXnki
 PJ12ky0up5zIy4SdVkLzdFk86pj/BvvuSJL1JTixLycU7uHlV+WL3fxv8/62KsWrS/Iu
 jW3HGW1HdhDNxqP2g2Z8U/UUoWS6eBsraHtHVOfPXDFiEG8oyQ1EVLQUwXOP6yym6ePp
 zPthClFEJoS5d3JrPz66Xw9xgpKn6BlRRshkNt63FXA3VUL/qGlPiB70c3B6tpwkjTVQ
 lmqQ==
X-Gm-Message-State: AOAM532FNrSHxo17H6Rb6VXenSsX2Y1O5qkUiwMkpw4ZnueOCIpsELUH
 HabcMUCmYJC0dYQPGvLH/XaQVGc/HUiAWA==
X-Google-Smtp-Source: ABdhPJw1tynpq/sUX6PbViAZt1+f8c0qVqACCF+y2boIYnt+c5T484AFt7Cr7fiFdz5k6nVObygMAA==
X-Received: by 2002:a1c:309:: with SMTP id 9mr1678651wmd.80.1607505768766;
 Wed, 09 Dec 2020 01:22:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m8sm2313992wmc.27.2020.12.09.01.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:22:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC6611FF7E;
 Wed,  9 Dec 2020 09:22:46 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-8-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 07/32] i386: hvf: remove stale MAINTAINERS entry for
 old hvf stubs
Date: Wed, 09 Dec 2020 09:22:42 +0000
In-reply-to: <20201208194839.31305-8-cfontana@suse.de>
Message-ID: <87eejzfi55.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

