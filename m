Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B136B0997
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:42:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZu2m-00088i-0T; Wed, 08 Mar 2023 08:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pZu2d-000887-D1
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:41:17 -0500
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pZu2a-0000rp-UB
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:41:14 -0500
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 261709208
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hQJnX6AfAR2DhBVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApG8i1DEAz
 mZKDz/Saa2NZmbzLtpzYdu0o0MDscXTztZhTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0i1aYDkpOs/jY8Eg37Kyp0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP06PJhLgYEG7FJxeotJ0FE6
 N4UchMSO0Xra+KemNpXS8Fpj8UnadDoZcYR4Ck4iz7eCvkiTNbIRKCiCd1whm9hwJATW6yEP
 YxDMWIHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBpujeLnVYpgNABNvLZXN6FZeVek3+V5
 UzizknECyohNNeQnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN+XNro/JqrAqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXwDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:LYwv06m8fH9TZtn3vR26BT5sHZ7pDfM7iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdC9qADnhOZICOgqTP6ftWbdyQ6Vxe1Zg7cKhgeQfREWldQtnZ
 uIEZIObOEYZGIS5aqU3OD7KadG/DDtysCVbJLlvhVQpHZRGsJdBmlCazqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCWF2QIRO/KovzMjdbDbQQdDxAqxQGShXfwgYSKWSSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlvxxnLe9JNfnfrm059mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWeuh32wTTt1z4o9jvL1UKYqWGLm720eBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXG4cTSXR0CrDv6nZNiq59cs5Vsa/pfVFZjl/1dwKqTKuZDIMvO0vFnLA
 CpNrCY2B8ZSyLfU5mThBgV/DXlZAVIIv7BeDlOhiXd6UkqoFlpi0Qf38ARhXEG6dY0TIRF/f
 3NNuBymKhJVdJ+V9MIOA4te7rENoX2e2O4DEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiJ8/go
 7IXl9UvXM7PxuGM7z54LRbthTWBGmtVzXkzc9To5B/p73nXbLudSmOUkonncesq+gWRsfbR/
 GwMpRLBOKLFxqYJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObpbns+TKGcyjV4YF0QxUKl8XLk
 FzIgQbfv8wknxDckWI/yT5SjfqZlH1+452HezT4/UTobJ9R7Fxjg==
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Mar 2023 08:41:05 -0500
Received: by mail-qk1-f200.google.com with SMTP id
 q25-20020a37f719000000b00742bfdd63ecso9318422qkj.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678282865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XeMNp+dKuXfFUOsdd/pxg0nLKSDn2522aaqzlizYXSw=;
 b=BdVMR1L8oJiL1R3iUuzSfOTSCZ46HhRuYLW9AOe9YblVWxhNcRZE0uMVDQ8PCPz2Ht
 Bw635EOFJlT+0EeL8lwD9T4zzlyAHqG7IHVi8/dpRkB3iQjtW+sPM54M8h64dGuyStMy
 N67MNMJXCH9l2Yk4+3Jtm/bbNUQJbll41ZGPaSg78ZrL6ODer/xmHFieTqcOFxuxxOQB
 rF6s+4Au2OpSIq9iy1Jx5v2tThPw/h9/BVLhckQAK4AGg9Uuoo2vedTBa7DEqeSQdNGG
 HzuClOymVEI9dFrH/2sDTzD+CFVE/SKglJU9dmHAecBrSJ2QnWbeFp8uW0aN/5FvJ0qr
 3uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678282865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeMNp+dKuXfFUOsdd/pxg0nLKSDn2522aaqzlizYXSw=;
 b=gXFJKecaSwQiXplHLhfcuCWa4m3zKYW1+yRcONKtt/PEwymsKWFuWCRXnY2WMUf428
 cNN0BKB3WEymXlVJPf1opwaK0msiyxBdOL2vsND96O3XZNg40gMqz8BgbliC4q17e/DF
 9wYADQOGd7fvPLDDXKgALgFEMXQKLLY7SvgJ1CPqlwiBsP8Vvy4yI80V1NrRqQ0MLub7
 1SvQMM+zppWsYvhkMAxKgZB5yOJf6omEEUhO1Y970XMJ9ZZsPnsCDmPqXo4vAVbKG9P9
 yTMMnW3d8SpvVRJGvfNz8jR/QLzU8ycyUimzR0ocGV2FJ+BCUCX+FTJ/Pv21jMJTEJ7F
 9bMg==
X-Gm-Message-State: AO0yUKVweeNjwts12yUJW7WcsW0MUDgNhi7bvx2ReF11wONzxgDoDLcg
 S3geDtUZT302/lkhrgzobioVeguHmC3S+rA8fHYHncEYCXB/58u53ehREBzG3pfpiTZke6il+qZ
 Mf0OcogB4oIUrlmXIrYUGTWuK/0/Gp0L1hs7/dVtwKgc=
X-Received: by 2002:a05:622a:24c:b0:3bf:d07e:ee17 with SMTP id
 c12-20020a05622a024c00b003bfd07eee17mr31520597qtx.39.1678282864848; 
 Wed, 08 Mar 2023 05:41:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9JAtn69USO3FMeP6CEEACn5XSYvuDn3tmvl3Bj7ZyS5jafvCWJ8asqrpTdp+BcRCXr0pwytg==
X-Received: by 2002:a05:622a:24c:b0:3bf:d07e:ee17 with SMTP id
 c12-20020a05622a024c00b003bfd07eee17mr31520545qtx.39.1678282864467; 
 Wed, 08 Mar 2023 05:41:04 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 6-20020ac856e6000000b003bd01b232dbsm11581726qtu.43.2023.03.08.05.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 05:41:03 -0800 (PST)
Date: Wed, 8 Mar 2023 08:40:58 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Jon Maloy <jmaloy@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 4/4] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Message-ID: <20230308133014.6dq45b6gszj3lpee@mozz.bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-5-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205040737.3567731-5-alxndr@bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

[[ CCing qemu-devel in case someone can spot something wrong faster than me]]

On 230308 1042, Thomas Huth wrote:

[snip]

> > > I'd really love to see this series included in QEMU 8.0, so to help with
> > > testing a little bit, I've put it in my gitlab-CI for testing. However, it
> > > hit a segfault in the macOS runner:
> > > 
> > > https://gitlab.com/thuth/qemu/-/jobs/3889796931#L4757
> > > 
> > > Do you have an idea what might be going wrong here?
> > > 
> > 
> > Unfortunately I wasn't able to reproduce this on x86_64 linux and I
> > don't have a mac to test on. I will try to comb through the code in
> > patch 4/4 as that seams like the most likely culprit.
> 
> Yes, you're right, it's the final patch that is causing the problem. I've
> pushed the branch without the final patch, and here it was still working
> fine:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/3893883020
> 
> I also don't have a mac for testing, but cirrus-ci recently started to offer
> terminal access to the jobs ... so if you've got a github account, you could
> fork the qemu repo there and enable the cirrus-ci for it in the marketplace.
> See .gitlab-ci.d/cirrus/README.rst for how to trigger it via the gitlab-CI.
> Or if that's too complicated right now, let me know if I can test something
> for you in my setup.

The detailed cirrus logs indicate that the last test in bios-tables-test
was /x86_64/acpi/q35/multif-bridge and it started qemu with these devices:

-display none -machine q35 -accel kvm -accel tcg -net none -S -device
virtio-balloon,id=balloon0,addr=0x4.0x2 -device
pcie-root-port,id=rp0,multifunction=on,port=0x0,chassis =1,addr=0x2
-device pcie-root-port,id=rp1,port=0x1,chassis=2,addr=0x3.0x1 -device
pcie-root-port,id=rp2,port=0x0,chassis=3,bus=rp1,addr=0.0 -device
pci-bridge,bus=rp2,chassis_nr=4,id=br1 -device
pcie-root-port,id=rphptgt1, port=0x0,chassis=5,addr=2.1 -device
pcie-root-port,id=rphptgt2,port=0x0,chassis=6,addr=2.2 -device
pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3 -device
pci-testdev,bus=pcie.0,addr=2.4 -device pci-testdev,bus=pcie .0,addr=5.0
-device pci-testdev,bus=rp0,addr=0.0 -device pci-testdev,bus=br1 -drive
id=hd0,if=none,file=tests/acpi-test-disk-0q5LlN,format=raw -device
ide-hd,drive=hd0

using these identical arguments I still could not reproduce the issue
(replacing the test disk). The test attaches a few devices but it
doesn't seem like they would be related. 

Out of the listed devices, the ones that were touched in patch 4 seem to
be virtio-balloon and ide. 

I took at quick look at the corresponding changes and didn't immediately
notice something wrong, but I'll keep digging. Still have no clue why it
would only show up on mac (I tried different compilers and asan).

-Alex

