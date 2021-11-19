Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF92D457369
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:49:20 +0100 (CET)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo74h-0007Xh-I9
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:49:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6Si-0005Rx-7T
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6Se-00057g-Dd
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637338199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ObiipgFLkn1KNVX+ImG0hqwb4NhoY38Bu49jh+8I19Q=;
 b=ISmhTh6IWctkkRod4Dcj+ZujoKYJM4YUcsR1+Qt3jOW7oWTz8U26L6SJd7vxqWJ+hI5bwN
 53VbOM0JY9UPMi7TZgw3YOu8OABf6u3UYhdXTsz+Xf5AqOlAWieyFDhGvYhf6e0Aiq1em+
 EoWo2WwrF1+YlviFZxkuhLGxsXxOKAQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-bgMU4AHaMvCz6EBA-Tpiyg-1; Fri, 19 Nov 2021 11:09:58 -0500
X-MC-Unique: bgMU4AHaMvCz6EBA-Tpiyg-1
Received: by mail-pl1-f200.google.com with SMTP id
 l14-20020a170903120e00b00143cc292bc3so4754466plh.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObiipgFLkn1KNVX+ImG0hqwb4NhoY38Bu49jh+8I19Q=;
 b=iLfrPpGCuDHnIVVOOSPiuxSJAi6JPLwLib2uAIUsaO+TvZ3S7iP1gHNorbBeagDbX9
 9inOZNLAIktA/IPq3I0CeFvzWvA1u78H6y0ISOF/K7WiWN5b2SPkBDVmM9wdxOJP0Ns0
 oIoNh/XlIb50EmD5ZoKAYFUxrH/d7tdeFCIz0CeUWDrywoRgCZOy/y5tNSDzzhWWYiW9
 LLCgl/RIw3VD4F9sTHuysKoriArmj5lzloYNY31oEfHewJxKT6O1YLrZH5H+e/YeCgI9
 nrQhFGW3MXZfUZFfN2wf6f4NfakBZVlyAcJWfCLJTf4cohkonPD2IsD/wQF1QSfPYyXM
 j0Yg==
X-Gm-Message-State: AOAM533SjncZuMx77zwFE7qnfzdmbjklSEKWMjIccnF8HFU2JaVtDG+x
 OCK5XgPWziKf2bgH4BjF1hEIzTFjwcslcKohvmEkfBXfnvawh0g23OiXU7TMzMW+1tjzIAWoW3h
 1PlN4gFp6rcLzOJrfR358PRnhu0Vsy6s=
X-Received: by 2002:a17:902:8645:b0:142:8c0d:3f4a with SMTP id
 y5-20020a170902864500b001428c0d3f4amr76972834plt.3.1637338196775; 
 Fri, 19 Nov 2021 08:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo765hCU6CBMwkEOV7PzGhOXsUuJk1e112nv73rgYZsb+iRi+V0ZvutEi+ttiwl6wRJFRcz/FXXOtxM8GhfrU=
X-Received: by 2002:a17:902:8645:b0:142:8c0d:3f4a with SMTP id
 y5-20020a170902864500b001428c0d3f4amr76972781plt.3.1637338196455; Fri, 19 Nov
 2021 08:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20211118204620.1897674-1-jsnow@redhat.com>
 <20211118204620.1897674-6-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-6-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 13:09:30 -0300
Message-ID: <CAKJDGDapeyB-2HAzNWrX6RumLOZvkZMkq6HAM2AiL-Fmb5BbtQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] python/machine: handle "fast" QEMU terminations
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 5:49 PM John Snow <jsnow@redhat.com> wrote:
>
> In the case that the QEMU process actually launches -- but then dies so
> quickly that we can't establish a QMP connection to it -- QEMUMachine
> currently calls _post_shutdown() assuming that it never launched the VM
> process.
>
> This isn't true, though: it "merely" may have failed to establish a QMP
> connection and the process is in the middle of its own exit path.
>
> If we don't wait for the subprocess, the caller may get a bogus `None`
> return for .exitcode(). This behavior was observed from
> device-crash-test; after the switch to Async QMP, the timings were
> changed such that it was now seemingly possible to witness the failure
> of "vm.launch()" *prior* to the exitcode becoming available.
>
> The semantic of the `_launched` property is changed in this
> patch. Instead of representing the condition "launch() executed
> successfully", it will now represent "has forked a child process
> successfully". This way, wait() when called in the exit path won't
> become a no-op.
> Signed-off-by: John Snow <jsnow@redhat.com>

Nitpick: double signed-off-by

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


