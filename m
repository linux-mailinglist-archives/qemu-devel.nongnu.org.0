Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3F245153
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 17:53:01 +0200 (CEST)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6yUO-0008Is-LE
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 11:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6ySe-0006rj-SB
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:51:12 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6ySb-0008BL-Ux
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:51:12 -0400
Received: by mail-oi1-x244.google.com with SMTP id h3so10871776oie.11
 for <qemu-devel@nongnu.org>; Sat, 15 Aug 2020 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n2KvY9IDYdDShIxDhKFH8cJge+7JRsHj9/Fs2NcQKa0=;
 b=e27KVh/tldtkJvt6zx5TY7b/ilmwEcSEOHE0KVWFcjtt+d6pQP4N1C8ipAMXcaW35c
 2ws9aKhNJdX0gIdnuvjF8qakKlc5VuyXmRCBq45ew8EksIcbKBuvdx+ysi6kHspoV8q5
 w31qIuJ0cBaIV5QGYnvZp7HAyowEYrxfOK6u9lTYYgovv2clvC+e7DNFD0r+3nvBjKl5
 2BJ8wTi5sHoEB1wq8rlgsEVZx8WuFYOg+FSokb0IxT6Dmx02AicLbNiPdBp0WG/6WyYi
 vdOeu+HgeFHAUIESwMyGju+a+zyem9iuIKRCHeUOOiTG8T5JovsQVH9UAJPM7KFwF0Gm
 oc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n2KvY9IDYdDShIxDhKFH8cJge+7JRsHj9/Fs2NcQKa0=;
 b=pnVkxA2brf+hP+wl2I7v8m8ndhVD6KUpKocV1E1TUioSGTU9BgdPijtPZr10uBg6ZP
 zk+ibE5Oyqw0Ssi1kYaIAW//CI9i7ccDBR1wRQTNqwit38z8oTSk6dvoNDSGRXcK1b6L
 QwzaM+oVNehd0qBiRMfxEudPEsFGUTaqehaIpd/pf9dEivIA4S+6dQGbJ2r7SCRHcxjo
 70h72DI1IePVT677LAbxMOLNhuYyT21TTIHDIRARMaiLV4Yp0oz1tpkbGKZjWys+X23K
 EulYlaq8vnDlPPyrR/Jj3Qh+QclUZne88wsjKNSByUs4tn7upfdLsLvwdcHXd6kWwpqx
 eJhg==
X-Gm-Message-State: AOAM531Ul1nKGlNfqHqqBq8fy7He74hGb2x//IDZ4xVSriHdnq3LByYo
 wyb1qsky9uZwjI3Q0/VxlNk0fhneK75D4w==
X-Google-Smtp-Source: ABdhPJyx6huxla01ozK41OjSCjUwUtakaju4sUpBZNPTMOp4eb8lkOrzO2el+GRoE4rMYwaFzWEFKA==
X-Received: by 2002:a17:90a:f416:: with SMTP id
 ch22mr3581658pjb.232.1597438931588; 
 Fri, 14 Aug 2020 14:02:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v78sm10690787pfc.121.2020.08.14.14.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 14:02:10 -0700 (PDT)
Subject: Re: [PATCH v5 11/14] hvf: remove hvf specific functions from global
 includes
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200812183250.9221-1-cfontana@suse.de>
 <20200812183250.9221-12-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7df4fd26-a103-60af-7d68-e4a0c9851242@linaro.org>
Date: Fri, 14 Aug 2020 14:02:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812183250.9221-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/20 11:32 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  accel/stubs/Makefile.objs  |  1 -
>  accel/stubs/hvf-stub.c     | 30 ------------------------------
>  include/sysemu/hvf.h       |  8 --------
>  target/i386/hvf/hvf-cpus.h |  8 ++++++++
>  target/i386/hvf/x86hvf.c   |  2 ++
>  target/i386/hvf/x86hvf.h   |  1 -
>  6 files changed, 10 insertions(+), 40 deletions(-)
>  delete mode 100644 accel/stubs/hvf-stub.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

