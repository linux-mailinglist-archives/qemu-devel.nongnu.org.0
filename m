Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713A139A5CD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:34:21 +0200 (CEST)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqIW-0005ka-Cs
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lopnt-0006VP-Oj
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lopnr-0000ZE-94
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622736158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89dIYAnVO7ALu1c76YdlwrSKiYK6oFWHMn25Xp6mU0c=;
 b=F5AJjNpeJtNKswBcymarcCXuoPLfOXVnReVCtdSVDkWgqJabQ1pBcizNmnflL+UnQgmtv6
 A4VYpnIIk0zCkmkt31RtsXksYiEstSXiXbrtkgLhxm2fIzOa8i9yELoWXdET2HVHhD9p+G
 foAFnujTFunJHoDWD+iwpx2q35yiIig=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-w00S3aM5P72YH-xg5vjYhA-1; Thu, 03 Jun 2021 12:02:37 -0400
X-MC-Unique: w00S3aM5P72YH-xg5vjYhA-1
Received: by mail-ej1-f70.google.com with SMTP id
 f1-20020a1709064941b02903f6b5ef17bfso2102733ejt.20
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=89dIYAnVO7ALu1c76YdlwrSKiYK6oFWHMn25Xp6mU0c=;
 b=EQbV3XGR/oXB+cAjEmcQjusJeWTjbnskNAt1tNLc4fV/pMSrAP1TPbS9+jgJ5jpVUY
 D1IT58E1gG3lUYAgPkmZkfDquGJlztmp3vFH5kX/HM21QMMDBPXAJ1XWC7y+ENDbYkou
 EMD2g6VaOxN74c/HFO/p+ux3/0gV2kRb1GgpjjvG6USi7/GoeRB+9e2H/gg8OoaHS0cC
 aeYPHx311rkmC74qgP/xXy8V4/7n/ujhMN26eE3wbrNVgVEAvwNTkmuw7K1zrZ/E0akq
 RZorLSg+seNcH5QEFpQ3pM/8ZrzekayEmwDVF7pJdIsvuMHCpl1Zpg+fgh0HZf3DDnZ5
 eMWw==
X-Gm-Message-State: AOAM5307zBqncELpEaFSSToy0FE8XyUE2HQGYPbh0vT+lNQNNzdyHfFC
 jXsbnNlicvjhYx1TFgQLHimhrPr7IiyXXVPI6rzl7UWQbehGyZpLTSIp5WjV/0MshzPdqmUsgOI
 a52aKl+9M/+3qGw8=
X-Received: by 2002:aa7:c913:: with SMTP id b19mr151735edt.323.1622736154631; 
 Thu, 03 Jun 2021 09:02:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy8PzlUOK0ZbuxDD9exgYuzAHoQWI1M8HQAc5LwUM7UJjDgjSZxCKeWLXK5lG7vDGCBGoK1Q==
X-Received: by 2002:aa7:c913:: with SMTP id b19mr151708edt.323.1622736154405; 
 Thu, 03 Jun 2021 09:02:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m15sm1674823eji.39.2021.06.03.09.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 09:02:33 -0700 (PDT)
Subject: Re: [RFC PATCH] docs/specs: QMP configuration design specification
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210601100729.23006-1-mirela.grujic@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a3d3febe-d2ec-6917-01ab-2c31fee1eee2@redhat.com>
Date: Thu, 3 Jun 2021 18:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601100729.23006-1-mirela.grujic@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@xilinx.com, damien.hedde@greensocs.com, jsnow@redhat.com,
 mark.burton@greensocs.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/06/21 12:07, Mirela Grujic wrote:
> diff --git a/docs/specs/qmp-configuration.txt b/docs/specs/qmp-configuration.txt
> new file mode 100644
> index 0000000000..69ff49cae6
> --- /dev/null
> +++ b/docs/specs/qmp-configuration.txt

docs/specs is not the right place, as it is for guest devices.  But this 
is completely irrelevant to the proposal, which doesn't need to live in 
docs/ at all.  So forget about it. :)

In general this is a good starting point.  We can either deprecate or 
stabilize x-machine-init once there is enough code written to have a 
working qemu-qmp-* binary.  Then we will know whether an 
accel-created->machine-init transition is needed or can be left implicit.

For now, what you propose is a very nice compromise that allows parallel 
work on machine/accel configuration on one hand, and device 
configuration on the other hand.  One other reason why that works well 
is that we have more or less opposite interests (I care mostly about 
machine/accel for example) so that's a natural way to split the work.

Thanks!

Paolo

> @@ -0,0 +1,112 @@
> +
> +Overview
> +--------
> +
> +The QMP configuration in the context of this design stands for customizing an
> +existing machine using the QEMU Monitor Protocol (QMP). The requirement for such
> +a configuration comes from the use cases where a complete system-on-chip can be
> +customized: from the number of cores, available peripherals, memories, IRQ
> +mapping, etc. Our goal is to enable the emulation of customized platforms
> +without requiring modifications in QEMU, and thus the QEMU recompilation.
> +
> +We will perform the QMP configuration from a QMP client that will communicate
> +with QEMU via a socket. As an example of a QMP client, we will include a script,
> +namely the QMP configurator, that will read QMP commands from a configuration
> +file and send them to QEMU, one by one. The configuration file will be a text
> +file that includes only a list of QMP commands to be executed.
> +
> +We will start QEMU with the -preconfig command-line option, thus QEMU will wait
> +for the QMP configuration at an early initialization phase, before the machine
> +initialization. The following configuration flow will rely on the machine
> +initialization phases. In each initialization phase, a set of QMP commands will
> +be available for configuring the machine and advancing it to the next
> +initialization phase. Upon reaching the final initialization phase, the machine
> +shall be ready to run. We specify detailed configuration flow in
> +"QMP configuration flow in QEMU."
> +
> +
> +QMP configurator
> +----------------
> +
> +We decided to include the QMP configurator, a QMP client script that will
> +communicate with QEMU, to automate the configuration. The QMP configurator will
> +read the QMP commands from the configuration file, send each QMP command to
> +QEMU, and quit at the end or exit earlier in the case of an error. We have not
> +envisioned the QMP configurator to be interactive. For debugging purposes, one
> +could use the QMP shell instead (scripts/qmp/qmp-shell).
> +
> +
> +QMP configuration file
> +----------------------
> +
> +The QMP configuration file will be a text file that includes only a list of
> +QMP commands which configure the machine. QMP commands in the configuration file
> +shall be in the same format and order as if they were issued using the QMP
> +shell. The QMP configurator will convert each command into JSON format before
> +sending it to QEMU, similarly as the QMP shell does.
> +
> +There are several ways to create a configuration file. One approach is to
> +manually create a list of QMP commands which specify how to configure the
> +machine. Another convenient method is to generate QMP commands from existing
> +descriptions, such as the device tree or a proprietary format. Either way, the
> +creation of the configuration file is out of the scope of this work.
> +
> +However, along with the QMP configurator, we will include an example of the
> +machine and its configuration file to demonstrate the QMP configuration
> +approach.
> +
> +
> +QMP configuration flow in QEMU
> +------------------------------
> +
> +We will build the QMP configuration flow on top of the machine initialization
> +phases, that are:
> +1) no-machine: machine does not exist yet (current_machine == NULL)
> +2) machine-created: machine exists, but its accelerator does not
> +   (current_machine->accelerator == NULL)
> +3) accel-created: machine's accelerator is configured
> +   (current_machine->accelerator != NULL), but machine class's init() has not
> +   been called (no properties validated, machine_init_done notifiers not
> +   registered, no sysbus, etc.)
> +4) initialized: machine class's init() has been called, thus machine properties
> +   are validated, machine_init_done notifiers registered, sysbus realized, etc.
> +   Devices added at this phase are considered to be cold-plugged.
> +5) ready: machine_init_done notifiers are called, then QEMU is ready to start
> +   CPUs. Devices added at this phase are considered to be hot-plugged.
> +
> +We can stop QEMU today using the -preconfig command-line option at phase 3
> +('accel-created'). This option was introduced to enable the QMP configuration of
> +parameters that affect the machine initialization. We cannot add devices at
> +this point because the machine class's init() has not been called, thus sysbus
> +does not exist yet (a device cannot be added because there is no bus to attach
> +it to).
> +
> +QEMU can be also stopped using the -S command-line option at the machine 'ready'
> +phase. However, it is too late to add devices at this phase because the machine
> +is already configured, and any devices added at this point are considered to be
> +hot-plugged.
> +
> +Since the existing -preconfig command-line option stops QEMU too early, and the
> +-S option stops too late, we need a way to stop QEMU in between (after the
> +machine is initialized and before it becomes ready).
> +
> +We will reuse the existing -preconfig command-line option to stop QEMU at the
> +'accel-created' phase. Then, we will add a QMP command, namely 'x-machine-init',
> +to advance and stop the machine in the next initialization phase
> +('initialized' phase). We will configure the machine during this phase using the
> +existing 'device_add' QMP command. Note that the use of 'device_add' QMP command
> +is currently not allowed before the machine is ready. We will enable the use of
> +'device_add' during the 'initialized' phase.
> +
> +Once we complete the configuration, we will advance the machine to the 'ready'
> +phase using the existing 'x-exit-preconfig' command. Upon the execution of
> +'x-exit-preconfig' command, the machine will immediately start running the guest
> +unless the -S option is provided as the command-line argument.
> +
> +We will also implement a QMP command to query the current machine initialization
> +phase, namely the 'query-machine-phase' command.
> +
> +--------------------------------------------------------------------------------
> +
> +This work is supported by Xilinx, SiFive, and Greensocs.
> +
> 


