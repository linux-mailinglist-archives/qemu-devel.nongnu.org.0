Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F82D4009
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:38:48 +0100 (CET)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwrv-0003I6-Os
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwq7-0002X7-34
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:36:55 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmwq4-00073M-Pq
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:36:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id y17so1159004wrr.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZVtNJ7kgztn8PaTehCEIUJkFU9GLDIAUz1vCrggm1yk=;
 b=sAYAbboqlXSNWJTCtzAYakF3Ym6VphrMP3rkxhkGdXuPDu90UT1wh6lKeYT74HSYGj
 VGj2wl/QSLkECtopvPDJ4Jncgob8kUEItdYTPMQ9dLJKaXoSnUDE8sDNIT/21VyCEA9d
 98tCmsaNhZjpWSavDAnnqDjEXIyo9bZUrQ+4a3uH22EONo/0dQeM1W8WbiTKoXIPPn4P
 Wyd3MwbzqjsRliEynYC3VwUTkKPB7a6os8vN7WuUNCVEtwsWFIlxTPfpXW9dxZ8nKDCr
 ARgCmYQstJnh/re8vPa53XfG4pAO5bjXv5q/HbuqFR/3kNw6pcvP5M1bVmRPu6ex50rF
 bCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZVtNJ7kgztn8PaTehCEIUJkFU9GLDIAUz1vCrggm1yk=;
 b=lAtLgMeZOIyMzIrdChO7Nlc9xIiG6DWwMhwIfFw6zRLuG+3zwZ0IvJwNpssybRFCpW
 PVVT1igCwYTiUcnMMjXo7vjgLo8zTZCvZ97dEz79wr71kEG9R8iVdvn0xuFH052DAWyG
 WlSoz4lEABlgjdNl0Bw+YauDGEDm6dTcT6JgmiT0PmM3QS/su86/91uWORiYDDh4G6tS
 NdnYw+d/oCMEGCG2Sqvgd3r+rIt0CS0cLbM4sFZCc+VpsLaYw4C+XHEl5YBygw0kRi1n
 owg3DvR+7/TqLHpSa3eBnxcAXqrbMdx8NyR9CJ8HmVc9HI8ZR12oceeG7frProOFJErv
 O+6A==
X-Gm-Message-State: AOAM533ms8W9vRQt9IU83ZUF/Yv7FNTViSLogRUUOd4NC7Q3SpiWBJgY
 /0lyNWY2LWmsevmWIcpz3LWaYg==
X-Google-Smtp-Source: ABdhPJzLrRqJYGbhdq4X97N1tYuXDr6T/8cST/g5MY9qCUwxGffjP4jW5LplWH1g4DjmHBLJy1Ri0Q==
X-Received: by 2002:a05:6000:1152:: with SMTP id d18mr59685wrx.6.1607510211008; 
 Wed, 09 Dec 2020 02:36:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm2471964wro.40.2020.12.09.02.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:36:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32BE21FF7E;
 Wed,  9 Dec 2020 10:36:49 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-13-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 12/32] tcg: make CPUClass.cpu_exec_* optional
Date: Wed, 09 Dec 2020 10:36:44 +0000
In-reply-to: <20201208194839.31305-13-cfontana@suse.de>
Message-ID: <87wnxre05a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
> This will let us simplify the code that initializes CPU class
> methods, when we move cpu_exec_*() to a separate struct.
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

