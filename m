Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1BF309E6C
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 20:57:54 +0100 (CET)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ir3-0002gX-St
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 14:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ipg-0001mD-Hy
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 14:56:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ipe-0002bF-NZ
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 14:56:28 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o5so1224845wmq.2
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dAgYKLhlmxxqoYIekMwmboxswc5FwL+f112TJwyreS8=;
 b=SAT8giHVtvzBQQetN87l3KCaCxqFnumVkFEhNZIWyHdnbpstvPJHwd7nKH1YwY/tk1
 vhKQS2LKpceRjSxyhyqEbjhZVbJCAditt2ipPDKF5+iAqQq45wjFRIjEOvKqICzWsNHe
 u0AcKKHoFyBNoZe4JL8NUuKa/TOrVPF5T1KHsFmv9MF0pZ30VrJD/xd3wQ+kQGm2jm9c
 t7HQ9dPkU++ZpInQERlsLVbGFhsXB2EAMj8pqcKJ6+yjdfVMHFopRaawDf6q+oCSAujE
 X2jTihDDmlZCNKliXErLIb/IWY2DirQTnN1Rg3lGM/8SxxPj6io6FvVMb8AcY9gsn2Fu
 RS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dAgYKLhlmxxqoYIekMwmboxswc5FwL+f112TJwyreS8=;
 b=e9i379cZA1OUquyd0GcnPwQaYkd8Z9LAJXwFGSvczisTVSH9oHfPPE2m9dz/ABv4TN
 1D8FbnWUZWpYLpolDTB9cYluoJBhykzn9KPPUYoIBFxx2g7LdJp5n4symh+S9tsHUzeD
 K7/+nuSpld15lB4X2KNNwqlUg3mnulK6PXlXFZa9IMG2Qyy8+Cv0hsiAghdoAsKnMiz8
 zx+evX+2NufzEt5NV/AMnUvW+hWIFrk509xLD3rbwhoAz0gqqYsGfdA+FOhmdcAEaohz
 GMmePVUjSrb6sRSpVkZjAvdg9bsSr4KiFsfDft++FebK3f0sO3rNyGP6Nd1lz1hjvZsW
 W+vA==
X-Gm-Message-State: AOAM531k8yIy9kkGPjgMmfzUKktMAJNcWf1F1dJRe9xL7ohXlHokKv1z
 sMFdj8iZP7XdmusVXmdXr+4=
X-Google-Smtp-Source: ABdhPJxwTrzaWN6Iw9iTxNmW2uhOHA3UkUVd/q5IuYy/y+hbjl2Ukf2RgBvAPaGXgXxRi0i0Q5P6Iw==
X-Received: by 2002:a05:600c:24b:: with SMTP id
 11mr11679929wmj.17.1612122985067; 
 Sun, 31 Jan 2021 11:56:25 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id x25sm18870456wmk.20.2021.01.31.11.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 11:56:24 -0800 (PST)
Subject: Re: [PATCH] simpletrace: build() missing 2 required positional
 arguments
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210131173415.3392-1-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <921899c1-d887-6eac-e088-e56012291ca8@amsat.org>
Date: Sun, 31 Jan 2021 20:56:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131173415.3392-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 6:34 PM, Volker Rümelin wrote:
> Commit 4e66c9ef64 "tracetool: add input filename and line number to
> Event" forgot to add a line number and a filename argument at one
> build method call site.
> 
> Traceback (most recent call last):
>   File "./scripts/simpletrace.py", line 261, in <module>
>     run(Formatter())
>   File "./scripts/simpletrace.py", line 236, in run
>     process(events, sys.argv[2], analyzer, read_header=read_header)
>   File "./scripts/simpletrace.py", line 177, in process
>     dropped_event =
>       Event.build("Dropped_Event(uint64_t num_events_dropped)")
> TypeError: build() missing 2 required positional arguments:
>   'lineno' and 'filename'

Oops

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Add the missing arguments.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  scripts/simpletrace.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> index 20f0026066..d61fb0bd87 100755
> --- a/scripts/simpletrace.py
> +++ b/scripts/simpletrace.py
> @@ -174,7 +174,9 @@ def process(events, log, analyzer, read_header=True):
>      if read_header:
>          read_trace_header(log)
>  
> -    dropped_event = Event.build("Dropped_Event(uint64_t num_events_dropped)")
> +    frameinfo = inspect.getframeinfo(inspect.currentframe())
> +    dropped_event = Event.build("Dropped_Event(uint64_t num_events_dropped)",
> +                                frameinfo.lineno + 1, frameinfo.filename)
>      edict = {"dropped": dropped_event}
>      idtoname = {dropped_event_id: "dropped"}
>  
> 


