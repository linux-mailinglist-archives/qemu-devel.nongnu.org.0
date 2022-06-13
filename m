Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436A547F6A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 08:11:47 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0dIf-0005Iz-8M
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 02:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0dBA-0002Ts-3M
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:04:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0dB6-0003RP-Op
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655100233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Anp/eFsThEVCb4RRzPnzCoUoU+GoQlxFOzefUKmJcbY=;
 b=VCIPj2sNumgj/3Qihynd+QFvCY1BcoTnicM4O1c0s+ZxzYjyUPGBB3eV1u+u7i140B/jAg
 tRQBTHjaKdHPRESBZ2vCH1UIW/ZA/r2VmPLKm4EpB63eNHRfK3Cb/U5fHw29kpgPMJ8B26
 0ed5h6NLVUi1KNCL004+fqAjf1gEVUg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-c6wht4IfMgSmzRAAG0QYqg-1; Mon, 13 Jun 2022 02:03:51 -0400
X-MC-Unique: c6wht4IfMgSmzRAAG0QYqg-1
Received: by mail-qk1-f197.google.com with SMTP id
 o10-20020a05620a2a0a00b006a77a64cd23so3149063qkp.21
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 23:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Anp/eFsThEVCb4RRzPnzCoUoU+GoQlxFOzefUKmJcbY=;
 b=x6mDrZhLb6HzMKR/XMSSCUEZnxTY9JqwrxWKTSVOMgyG7QDob7myFSwTPb0ZJz5iRi
 WQzysF8mXHwSPxC+yXN2INbt4r7svQVzt9DY8Rp0e2nDvbxu8MWMADwgZzOP57+r6ilZ
 ime5ZsCY3dZvzOrofgRomw0GSvKIqaHTIGUbL2k57OPgpJl+xl4cEtGoUMjVBK9IpUNc
 f5xgFZHWMdJdv3y72KUTQ0/ZwCzGWAEIA9qibs/WdbRBMyveaqEKXiMKQg8o5O/Tz1oY
 hxnsJAmsBmKgQ0mARoC5yLrrVAzblTqY7WJVzSN4OIkemUtksBiEGb3IQHaDIv6mUwoN
 C+zA==
X-Gm-Message-State: AOAM532V8f6EM+HCKUWAUoHgvs7DO+1V43z4EnJXqKPLxKO9YiyAPV9f
 umG7l+nfi2aqnZImqcO+SHkDbL4JW4aD9E/PTi3mYcVH8qBF07KpH7Q6ikUERix8H++dKC1PN7P
 Gu6ek3uy+8+WZTao=
X-Received: by 2002:ac8:5996:0:b0:305:1041:372e with SMTP id
 e22-20020ac85996000000b003051041372emr15329670qte.520.1655100230946; 
 Sun, 12 Jun 2022 23:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOB3WxP15aUvogVPZsq1eMlYcy0eVlNi21k55DsffXMLdjUP9HFtL6bxbBAKt6W95feqQmHg==
X-Received: by 2002:ac8:5996:0:b0:305:1041:372e with SMTP id
 e22-20020ac85996000000b003051041372emr15329659qte.520.1655100230661; 
 Sun, 12 Jun 2022 23:03:50 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 m7-20020a05620a290700b006a74da327fcsm6233157qkp.99.2022.06.12.23.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jun 2022 23:03:50 -0700 (PDT)
Message-ID: <48fba5eb-6b93-347f-9a8d-a757f19e5d55@redhat.com>
Date: Mon, 13 Jun 2022 08:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <CAFn=p-ZwWzYa9h_-rNa-cA0CsDOJusy21D_RNtLffpTOgOHP-Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: CentOS 8 cloud images not working under VM tests
In-Reply-To: <CAFn=p-ZwWzYa9h_-rNa-cA0CsDOJusy21D_RNtLffpTOgOHP-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/2022 01.28, John Snow wrote:
> This test doesn't appear to work for me:
> 
> def build_image(self, img):
>      cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
>      img_tmp = img + ".tmp"
>      subprocess.check_call(["ln", "-f", cimg, img_tmp])
>      self.exec_qemu_img("resize", img_tmp, "50G")
>      self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
>      self.wait_ssh()
>      ^^^^^^^^^^^^^^^
> 
> It appears to be expecting to be able to use passwordless entry, but
> that doesn't appear to actually work in this case.
> 
> It looks like the cloud iso generate step is supposed to handle
> setting up keys -- and everything appears as if it's working -- but I
> get SSH timeouts at this step.
> 
>  From what I can see:
> 
> DEBUG:root:ssh_cmd: ssh -t -o StrictHostKeyChecking=no -o
> UserKnownHostsFile=/dev/null -o ConnectTimeout=1 -p 41729 -i
> /home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa -o
> SendEnv=https_proxy -o SendEnv=http_proxy -o SendEnv=ftp_proxy -o
> SendEnv=no_proxy qemu@127.0.0.1 exit 0
> Warning: Permanently added '[127.0.0.1]:41729' (ED25519) to the list
> of known hosts.
> qemu@127.0.0.1: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
> 
> ...and the /home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa
> file looks identical to the qemu.git/tests/keys/id_rsa file, save for
> a missing trailing newline.
> 
>  From a subsequent run, turning SSH debug on, I see this:
> 
> debug1: Offering public key:
> /home/jsnow/src/qemu/bin/git/vm-test-o_x2vdwo.tmp/id_rsa RSA
> SHA256:6TUK9PSgWR+CbTEKA6E9IyizVjt2ZW5ble/Mg4wUiao explicit
> debug3: send packet: type 50
> debug2: we sent a publickey packet, wait for reply
> debug3: receive packet: type 51
> 
> ... Which looks like the usual kind of bog-standard "Unrecognized key"
> kind of answer, IIUC.
> 
> Is this working for anyone else, or can anyone offer some debugging
> tips on what's gone wrong here?
It seems to work for me - maybe it's some issue with a newer version of ssh 
on your host? (I'm still using RHEL 8 here).

Anyway, the VM dies shortly afterwards since it tries to install some 
additional packages, and non-Stream CentOS 8 has been disabled at the end of 
last year. So this test is certainly broken since half a year already and 
nobody noticed until now. I think you can either remove it, or it should get 
updated to CentosStream instead.

  Thomas


