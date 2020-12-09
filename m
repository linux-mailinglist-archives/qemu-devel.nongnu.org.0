Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50162D3D98
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:39:13 +0100 (CET)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmv0C-0004PO-Gr
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmuy4-0003w3-F1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:37:00 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmuy2-00085J-R8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:37:00 -0500
Received: by mail-wr1-x441.google.com with SMTP id a12so757506wrv.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 00:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4i+trfdrMMmK3f2llqeovMF9EPWZ5nuEnRP4p7wxBGI=;
 b=PGlz4WlK6UZgfN8VvWfufmNxVTp4cyF5tjqZ2cJgtYFAz7LgKpRh7yTRg4lxJOzivd
 SFsjcSPMuv/vEh6npxDYfQT7sZYThoN2GkrkLbCn8x146fd4c+hS7+1o+d6RgTGECpaa
 2fpeSho2grKWzcpCgXx+SZ6XUtjgOoB3H4A5NkdpPSP3WSEYcChjouHZVf/73remDrzQ
 y7Eclk7kM11t0YtmBXN+LOF84ID9JK+qgwuGFjpNbKeCJ75WCsvRJ7suPJtiuOMF5fhG
 QVEn+AY5qBacMUJXnVmD4sjrJD99L4/QyHd0XtEWDHjoI6z9Hkv4E+UgEIHqK01l4OYg
 D8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4i+trfdrMMmK3f2llqeovMF9EPWZ5nuEnRP4p7wxBGI=;
 b=iaghI9609+MJSNzYcTJQW/M97jCdE8dQQ8j6avd/0YEnZPPPS3G9GZobYFdusJNZ8E
 KrENiHn0zqt8V+dfVW+66HTNp/H3WEkFS3yHjTQRNr/+qOd+48L1qmcnCbCM630Sa323
 ZaVoUa+8HrxbmKZuR7aYMUZwr8J2grUu6w/0muwU6rsDySVPvPZ5WdlX7wnT+gTxfcMD
 v6PCelQkhvDU0IBWjs/EsKu40Z5RZeufjRJUuoL0jX6yItHSiY+zkDMq96UfFTx5rtWp
 RB57lfG1lqpJtn+4q1NWEp8AkFDnxtlvpgSJMg2sXK2tWmxwXVnTpf/xtz+6ZS9qReGK
 xRGw==
X-Gm-Message-State: AOAM531PQI8PfA4XSFPiVsYdReIUZ49TC7CVztavGmPxhWyLSlvrIa6V
 +MSPpIqr+DGBo9FVe8Z8+3hVhA==
X-Google-Smtp-Source: ABdhPJxzV7LLItAu5XUY7+zURqAqSTaqnX7cIUuhtnCo99GUwV7k6SZ9HW/vGjzeubgnKxzh5RhvEQ==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr1401428wrn.122.1607503017132; 
 Wed, 09 Dec 2020 00:36:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 34sm2057298wrh.78.2020.12.09.00.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 00:36:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B26EA1FF7E;
 Wed,  9 Dec 2020 08:36:54 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-2-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 01/32] accel/tcg: split CpusAccel into three TCG variants
Date: Wed, 09 Dec 2020 08:34:24 +0000
In-reply-to: <20201208194839.31305-2-cfontana@suse.de>
Message-ID: <87v9dbfk9l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
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
 "Emilio G .
 Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> split up the CpusAccel tcg_cpus into three TCG variants:
>
> tcg_cpus_rr (single threaded, round robin cpus)
> tcg_cpus_icount (same as rr, but with instruction counting enabled)
> tcg_cpus_mttcg (multi-threaded cpus)
>
<snip>
> diff --git a/accel/tcg/tcg-cpus-mttcg.c b/accel/tcg/tcg-cpus-mttcg.c
> new file mode 100644
> index 0000000000..dac724fc85
> --- /dev/null
> +++ b/accel/tcg/tcg-cpus-mttcg.c
> @@ -0,0 +1,117 @@
<snip>
> +
> +/*
> + * In the multi-threaded case each vCPU has its own thread. The TLS
> + * variable current_cpu can be used deep in the code to find the
> + * current CPUState for a given thread.
> + */
> +
<snip>
> +
> +/*
> + * In the multi-threaded case each vCPU has its own thread. The TLS
> + * variable current_cpu can be used deep in the code to find the
> + * current CPUState for a given thread.
> + */

nit: This is overly repetitive - I think we can drop the duplication in
the header. If anything the comment should probably be re-formulated at
the current_cpu definition in cpus-common.

<snip>

Otherwise nice clean-up ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

